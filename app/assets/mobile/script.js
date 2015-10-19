$(document).ready(function(){
  var max = $('#start_time').val();
  var min = $('#end_time').val();
  var rangeSlider = $('#slider')
    .slider({
      min: 1,
      max: 24,
      step: 1,
      values: [1, 24],
      value: $("#start_time").selectedIndex + 1,
      range: true,
      animate: true,
      slide: function(e,ui) {
		$('#start_time')[0].selectedIndex = ui.value - 1;
 		$('#end_time')[0].selectedIndex = ui.value;
       $(this)
          .parent().find('#start_time  option:selected').val(ui.values[0]).text();
        $(this)
          .parent().find('#end_time option:selected').val(ui.values[1]).text();
      },
	  stop: function(event, ui) {
         // $.get("#", { start_time: $("#start_time").val(), end_time: $("#end_time").val()} );
		// alert($("#start_time").val()+" "+$("#end_time").val());
		   alert("Положение бегунков: " + ui.values);
		 }
    })
 // .before('<h3>Drag the slider to filter by price:</h3>');
      
  $('#tablo_form').after(rangeSlider);
});
