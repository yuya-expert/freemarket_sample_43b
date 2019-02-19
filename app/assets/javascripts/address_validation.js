$(document).on("turbolinks:load",function(){
  //住所入力のバリデーション
  $(".address-registration--net-btn").click(function(e){
    var judge = 0;
    // 郵便番号
    var postal_code = $(".address-registration--postal-code").val()
    if(postal_code.length == 0) {
      $(".error-text-postal-code").show();
      $(".address-registration--postal-code").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-postal-code").hide();
      $(".address-registration--postal-code").css("border","1px solid #ccc ");
    }
    //都道府県
    var prefecture = $(".select-city-governments").val()
    if(prefecture == 0) {
      $(".error-text-prefecture ").show();
      $(".select-city-governments").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-prefecture ").hide();
      $(".select-city-governments").css("border","1px solid #ccc ");
    }

    //市区町村
    var city = $(".address-registration--cities-textarea").val()
    if(city.length == 0) {
      $(".error-text-city").show();
      $(".address-registration--cities-textarea").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-city").hide();
      $(".address-registration--cities-textarea").css("border","1px solid #ccc ");
    }

    //番地
    var address = $(".address-registration--address-detail-textarea").val()
    if(address.length == 0) {
      $(".error-text-address").show();
      $(".address-registration--address-detail-textarea").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-address").hide();
      $(".address-registration--address-detail-textarea").css("border","1px solid #ccc ");
      //セレクトのアイコンのズレの修正
      $(".fas.fa-angle-down").css("top","40% ");
    }
    if(judge != 0) {
      e.preventDefault();
      $('body, html').animate({ scrollTop: 0 }, 1);
      return false;
    }
  })
})
