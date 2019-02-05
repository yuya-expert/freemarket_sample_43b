$(function(){
  $("#price-field").keyup(function(){
    if($(this).val() == "") {
      $("#tax-field").html("-");
      $("#profit-field").html("-");
    }
    var $price = $(this).val();
    var tax = Math.floor($price * 0.1);
    var profit = $price - tax;
    var numberWithComma = new Intl.NumberFormat();
    $("#tax-field").html("¥" + numberWithComma.format(tax));
    $("#profit-field").html("¥" + numberWithComma.format(profit));
  })
})
