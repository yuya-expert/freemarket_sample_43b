$(document).on("turbolinks:load", function() {
  var sold = $('.sold').val();
  $('.content-item-product-state-buy').hide();
  $('.message-submit.btn-gray-buy').hide();
  // 購入できる場合の処理
  if( sold == "未定"){
      // 商品のSOLD OUT表示を削除
    $('.item-tag-sold-out-top').hide();
      // 商品購入ボタンの表示
    $('.content-item-product-state-buy').show();
      // 売り切れのためコメントできませんの非表示
    $('.message-submit.btn-gray').hide();
      // コメントするの表示
    $('.message-submit.btn-gray-buy').show();
    $('.buy-button-soldout').hide();
    $('.buy-button-buy').show();
    $('.content-item-product-state').hide();
    $('.content-item-product-state-buy').show();
  }
});
