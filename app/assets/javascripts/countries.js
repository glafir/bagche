$(function() {
  $("#countries th a, #countries .pagination a").on("click", '', function() {
    $.getScript(this.href);
    return false;
  });
  $("#countries_search input").keyup(function() {
    $.get($("#countries_search").attr("action"),
    $("#countries_search").serialize(), null, "script");
    return false;
  });
});

