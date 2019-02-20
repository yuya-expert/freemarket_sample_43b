$(document).on("turbolinks:load",function(){
  //クレジットカード入力のバリデーション
  $(".creditcard-registration--net-btn").click(function(e){
    var judge = 0;
    // カード番号
    var card_number = $(".creditcard-registration--card-number-textarea").val()
    if(card_number.length == 0) {
      $(".error-text-card-number").show();
      $(".creditcard-registration--card-number-textarea").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-card-number").hide();
      $(".creditcard-registration--card-number-textarea").css("border","1px solid #ccc ");
    }

    //有効期限(月)
    var expiration_month = $(".select-expiration-date-month").val()
    if(expiration_month == 0) {
      $(".error-text-expiration-date-month").show();
      $(".select-expiration-date-month").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-expiration-date-month").hide();
      $(".select-expiration-date-month").css("border","1px solid #ccc ");
    }

    //有効期限(年)
    var expiration_year = $(".select-expiration-date-year").val()
    if(expiration_year == 0) {
      $(".error-text-expiration-date-year").show();
      $(".select-expiration-date-year").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-expiration-date-year").hide();
      $(".select-expiration-date-year").css("border","1px solid #ccc ");
    }

    // カード番号(セキュリティーコード)
    var security_code = $(".creditcard-registration--security-code-textarea").val()
    if(security_code.length == 0) {
      $(".error-text-security-code").show();
      $(".creditcard-registration--security-code-textarea").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-security-code").hide();
      $(".creditcard-registration--security-code-textarea").css("border","1px solid #ccc ");
    }
    if(judge != 0) {
      e.preventDefault();
      $('body, html').animate({ scrollTop: 0 }, 1);
      return false;
    }
  })
})
