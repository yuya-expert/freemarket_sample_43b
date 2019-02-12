$(function(){

  $(document).on('turbolinks:load', function() {
      // 「imageList」内の「img」をマウスオーバーした場合
      $('.item-sub').hover(function(){

          // マウスオーバーしている画像をメインの画像に反映
          $('.item-main').attr('src', $(this).attr('src'));

    });
  });
});
