$(document).ready(function(){ 
  var user_suggestions = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('full_name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      ttl: 1,
      url: '/groups/typeahead.json',
      cache: false
    }
  });
  
  user_suggestions.initialize();

  $('input#user1').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user2').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user3').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });


  $('input#user4').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });


  $('input#user5').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });


  $('input#user6').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user7').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user8').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user9').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });

  $('input#user10').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'full_name',
    displayKey: 'full_name',
    source: user_suggestions.ttAdapter(),
    limit: 10
  });
});
