$(function() {
  hideSearchInput();
  searchFormToggle();
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