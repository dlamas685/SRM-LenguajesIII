/* ====== Index ======

1. JEKYLL INSTANT SEARCH


====== End ======*/

$(document).ready(function() {
  "use strict";

  /*======== 1. JEKYLL INSTANT SEARCH ========*/

  SimpleJekyllSearch.init({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('search-results'),
    dataSource: '/Herramientas/plugins/search/data/search.json',
      searchResultTemplate: '<li class="list-group border-bottom"><div class="link font-weight-medium"><a href="{link}" class=" w3-hover-text-pink">{label}</a></div><div class="location ">{location}</div><\/li>',
      noResultsText: '<li class="list-group w3-text-pink font-weight-medium">No se han encontrado resultados</li>',
    limit: 4,
    fuzzy: true
  });
});
