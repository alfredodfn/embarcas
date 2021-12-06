var ready;
ready = function () {
  var engine = new Bloodhound({
    datumTokenizer: function (d) {
      return Bloodhound.tokenizers.whitespace(d.name);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '../cities/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });

  var promise = engine.initialize();

  promise
    .done(function () { console.log('success!'); })
    .fail(function () { console.log('err!'); });

  $('.typeahead').typeahead(null, {
    name: 'engine',
    displayKey: 'name',
    source: engine.ttAdapter()
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);