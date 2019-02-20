$(document).on("turbolinks:load",function(){
  // 電話番号認証、認証番号の入力のバリデーション
  $(".SMS-submit").click(function(e){
    var judge = 0;
    // 電話番号認証、認証番号入力
    var phone_number = $(".phone-number-text-field").val()
    if(phone_number.length == 0 ) {
      $(".error-text-certification").show();
      $(".error-text-check").show();
      $(".phone-number-text-field").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-certification").hide();
      $(".phone-number-text-field").css("border","1px solid #ccc ");
    }
    if(judge != 0) {
      e.preventDefault();
    }
  })
})
