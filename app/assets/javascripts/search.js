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
          debugger
        }
       })
     }
  });
}
