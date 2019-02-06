$(function(){
  $("#create-btn").submit(function(e){
    var judge = 0;
    // バリデーション
    // 出品画像
    console.log($(".preview-file").children().attr("src"));

    // 商品名
    if($(".product-data__name").val() == ""){
      $(".error-message.error_product-name").show();
      judge += 1;
    } else {
      $(".error-message.error_product-name").hide();
    }
    // 商品の詳細
    if($(".product-data__detail").val() == ""){
      $(".error-message.error_product-detail").show();
      judge += 1;
    } else {
      $(".error-message.error_product-detail").hide();
    }
    // カテゴリー
    if($(".product-detail__category").val() == "" || $(".product-detail__category").val() == "---"){
      $(".error-message.error_category").show();
      judge += 1;
    } else {
      $(".error-message.error_category").hide();
    }
    // サイズ
    if($(".product-detail__size").val() == "---"){
      $(".error-message.error_size").show();
      judge += 1;
    } else {
      $(".error-message.error_size").hide();
    }
    // 商品の状態
    if($(".product-detail__status").val() == "---"){
      $(".error-message.error_product-status").show();
      judge += 1;
    } else {
      $(".error-message.error_product-status").hide();
    }
    // 配送料の負担
    if($(".product-delivery__fee").val() == "---"){
      $(".error-message.error_delivery-fee").show();
      judge += 1;
    } else {
      $(".error-message.error_delivery-fee").hide();
    }
    // 配送の方法
    if($(".product-detail__how-to-delivery").val() == "---"){
      $(".error-message.error_how-to-delivery").show();
      judge += 1;
    } else {
      $(".error-message.error_how-to-delivery").hide();
    }
    // 発送元の地域
    if($(".product-delivery__area").val() == "---"){
      $(".error-message.error_area").show();
      judge += 1;
    } else {
      $(".error-message.error_area").hide();
    }
    // 発送までの日数
    if($(".product-delivery__days").val() == "---"){
      $(".error-message.error_shipping-dates").show();
      judge += 1;
    } else {
      $(".error-message.error_shipping-dates").hide();
    }
    // 価格
    $price = Number($(".product-price__sell").val())
    if($price >= 10000000 || $price < 300 ){
      $(".error-message.error_price").show();
      judge += 1;
    } else {
      $(".error-message.error_price").hide();
    }
    if(judge != 0){
      e.preventDefault();
    }
  })
})
