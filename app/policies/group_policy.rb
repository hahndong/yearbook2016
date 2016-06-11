class GroupPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @group = model
  end

  def new?
    @current_user.user? || @current_user.admin?
  end

  def index?
    @current_user.user? || @current_user.admin?
  end
  def indexprint?
    @current_user.admin?
  end

  def create?
    @current_user.user? || @current_user.admin?
  end

  def edit?
    @group.users.include?(@current_user) || @current_user.admin?
  end

  def update?
    @group.users.include?(@current_user) || @current_user.admin?
  end

  def show?
    @group.users.include?(@current_user) || @current_user.admin?
  end

  def destroy?
    @group.users.include?(@current_user) || @current_user.admin?
  end

  

end