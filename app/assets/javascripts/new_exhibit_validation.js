$(document).on("turbolinks:load", function(){
  $("#create-btn").submit(function(e){
    var judge = 0;
    // バリデーションの関数
    function validation_blanc(selecta) {
      if(selecta.val() == "" || selecta.val() == "---") {
        selecta.next().show();
        judge += 1;
      } else {
        selecta.next().hide();
      }
    }
    // 商品名
    validation_blanc($(".product-data__name"));
    // 商品の詳細
    validation_blanc($(".product-data__detail"));
    // カテゴリー
    validation_blanc($(".product-detail__category"));
    // サイズ
    validation_blanc($(".product-detail__size"));
    // 商品の状態
    validation_blanc($(".product-detail__status"));
    // 配送料の負担
    validation_blanc($(".product-delivery__fee"));
    // 配送の方法
    validation_blanc($(".product-detail__how-to-delivery"));
    // 発送元の地域
    validation_blanc($(".product-delivery__area"));
    // 発送までの日数
    validation_blanc($(".product-delivery__days"));
    // 価格
    $price = Number($(".product-price__sell").val())
    if($price >= 10000000 || $price < 300 ){
      $(".error-message.error_price").show();
      judge += 1;
    } else {
      $(".error-message.error_price").hide();
    }
    if(judge != 0){
      console.log(judge)
      e.preventDefault();
    }
  })
})
