$(function() {
  hideSearchInput();
  searchFormToggle();
  submitSearch();
});

function hideSearchInput() {
  $("[data-search='input']").hide()
}

function searchFormToggle() {
  $("[data-search='icon']").on('click', function(e) {
    console.log('in click function')
    $("[data-search='input']").toggle('slow')
  })
}

function submitSearch() {
  $("[data-search='input']").keydown(function(event) {
    event.preventDefault();
    event.stopPropagation();
    if (event.keyCode == 13) {
       var data = $("[data-search='input']").val();
       $.ajax({
        url: '/search',
        method: 'POST',
        dataType: 'json',
        data: $("[data-id='form']") .serialize(),
        success: function(response) {
          debugger;
        }
       })
     }
  });
}

// event.preventDefault();
//   event.stopPropagation();
//   $.ajax({
//     url: 'http://localhost:3000/api/v1/songs', 
//     method: 'POST', 
//     dataType: 'json',
//     data: $("#new-song-form").serialize(), 
//     success: function(response) {
//       debugger;
//     }
//   })