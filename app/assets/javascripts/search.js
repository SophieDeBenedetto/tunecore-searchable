$(function() {
  submitSearch();
});

function submitSearch() {
  $("[data-search='input']").keydown(function(event) {
    //event.preventDefault();
    if (event.keyCode == 13) {
       var data = $("[data-search='input']").val();
       $.ajax({
        url: '/search',
        method: 'POST',
        dataType: 'json',
        data: $("[data-id='form']").serialize(), 
        success: function(response) {
          var table = renderSearchResultTable(response)
          $("#search-results").html(table)
        }
       })
     }
  });
}

function renderSearchResultTable(songs) {
  var tableOpening = '<table class="table table-striped table-hover"><thead><tr><th>#</th><th>song title</th><th>artist</th><th>album</th></tr></thead><tbody>'

  var tableClosing = '</tbody></table>'
  
  var tableRows = songs.map(function(song, i) {
    return `<tr><td>${i + 1}</td><td>${song.title}</td><td>${song.artist.name}</td><td>${song.album.title}</td></tr>`
  })
  return tableOpening + tableRows.join("") + tableClosing
}
