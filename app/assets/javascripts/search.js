$(document).on('turbolinks:load', function() {

  submitSearch();

});


function submitSearch() {
  $("[data-search='input']").keydown(function(event) {
    //event.preventDefault();
    debugger;
    if (event.keyCode == 13) {
       var data = $("[data-search='input']").val();
       $.ajax({
        url: '/search',
        method: 'POST',
        data: $("[data-id='form']").serialize()
       })
     }
  });
}
