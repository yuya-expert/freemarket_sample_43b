$(document).on("turbolinks:load",function(){
  // ユーザー新規登録時のバリデーション
  $("#new_user").submit(function(e){
    var judge = 0;
    // メールアドレス判定
    if($(".sign-up__email").val().length == 0) {
      $(".email-error").show();
      $(".email-format-error").hide();
      judge += 1;
    } else if($(".sign-up__email").val().match(/.+@.+/)) {
      $(".email-error").hide();
      $(".email-format-error").hide();
    } else {
      $(".email-error").hide();
      $(".email-format-error").show();
      judge += 1;
    }
    // パスワード判定
    var password = $(".sign-up__password").val()
    if(password.length == 0) {
      $(".password-error").show();
      $(".password-length-error").show();
      judge += 1;
    } else if(password.length < 6  ) {
      $(".password-error").hide();
      $(".password-error-length").show();
      judge += 1;
    } else {
      $(".password-error").hide();
      $(".password-length-error").hide();
    }
    // パスワード(確認)判定
    var password_confirmation = $(".sign-up__password_confirmation").val()
    if(password.length == 0) {
      $(".password_confirmation-error").show();
      $(".password_confirmation-integrity-error").hide();
      judge += 1;
    } else if(password != password_confirmation) {
      $(".password_confirmation-error").hide();
      $(".password_confirmation-integrity-error").show();
      judge += 1;
    } else {
      $(".password_confirmation-error").hide();
      $(".password_confirmation-integrity-error").hide();
    }
    if(judge != 0) {
      e.preventDefault();
    }
  })
})
