class User < ActiveRecord::Base
  acts_as_token_authenticatable

  def send_invit
    self.invit = 0 if self.invit == nil
    invit = self.invit + 1
    self.update_attribute(:invit, invit)
    SendToUsers.invitation(self).deliver
  end

  # Update SELF authentication token
  # To do: User.all.each(&:auth_token_changer)
  def auth_token_changer
    self.update_attribute(:authentication_token, generate_authentication_token)
  end
  
  require 'csv'
  require 'roo'

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      header = column_names
      csv << header
      all.each do |user|
        row = user.attributes.values_at(*column_names)
        row = row << user.solo.present?
        csv << row
      end
    end
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token if token_suitable?(token)
    end
  end

  def token_suitable?(token)
    self.class.where(authentication_token: token).count == 0
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :solo
  has_and_belongs_to_many :groups

  enum role: [:user ,:admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
    self.invit ||= 0
  end

  # before_save :set_invit
  #def set_invit
  #  self.update_attribute(:invit, 0)
  #end
end
