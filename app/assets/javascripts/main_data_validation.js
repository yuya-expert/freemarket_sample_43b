$(document).on("turbolinks:load",function(){
  // ユーザー新規登録時のバリデーション
  $(".new-registration--net-btn").click(function(e){
    var judge = 0;
    // ニックネーム
    var nickname = $(".new-registration--nickname-textarea").val()
    if(nickname.length == 0) {
      $(".error-text-nickname").show();
      $(".new-registration--nickname-textarea").css("border","1px solid #ea352d ")
      judge += 1;
    } else {
      $(".error-text-nickname").hide();
      $(".new-registration--nickname-textarea").css("border","1px solid #ccc ");
    }
    // パスワード判定
    var password = $(".new-registration--password").val()
    if(password.length == 0) {
      $(".error-text-password").show();
      $(".error-text-password-limit").show();
      $(".new-registration--password").css("border","1px solid #ea352d ")
      judge += 1;
    } else if(password.length < 6  ) {
      $(".error-text-password").hide();
      $(".error-text-password-limit").show();
      $(".new-registration--password").css("border","1px solid #ea352d ")
      judge += 1;
    } else {
      $(".error-text-password").hide();
      $(".error-text-password-limit").hide();
      $(".new-registration--password").css("border","1px solid #ccc ");
    }
    //パスワード確認
    var password_confirmation = $(".new-registration--password-confirmation").val()
    if(password.length == 0) {
      $(".error-text-password-confirmation").show();
      $(".error-text-password-confirmation-match").hide();
      $(".new-registration--password-confirmation").css("border","1px solid #ea352d ")
      judge += 1;
    } else if(password != password_confirmation) {
      $(".error-text-password-confirmation").hide();
      $(".error-text-password-confirmation-match").show();
       $(".new-registration--password-confirmation").css("border","1px solid #ea352d ")
      judge += 1;
    } else {
      $(".error-text-password-confirmation").hide();
      $(".error-text-password-confirmation-match").hide();
      $(".new-registration--password-confirmation").css("border","1px solid #ccc ");
    }
    //メールアドレス
    var email = $(".new-registration--mail-address").val()
    if(email.length == 0) {
      $(".error-text-mail").show();
      $(".new-registration--mail-address").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-mail").hide();
      $(".new-registration--mail-address").css("border","1px solid #ccc ");
    }
    //姓
    var family_name = $(".new-registration--family-name").val()
    if(family_name.length == 0) {
      $(".error-text-family-name").show();
      $(".new-registration--family-name").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-family-name").hide();
      $(".new-registration--family-name").css("border","1px solid #ccc ");
    }
    //名
    var personal_name = $(".new-registration--personal-name").val()
    if(personal_name.length == 0) {
      $(".error-text-personal-name").show();
      $(".new-registration--personal-name").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-personal-name").hide();
      $(".new-registration--personal-name").css("border","1px solid #ccc ");
    }
    //姓(カタカナ)
    var family_name_kana = $(".new-registration--family-name-kana").val()
    if(family_name_kana.length == 0) {
      $(".error-text-family-name-kana").show();
      $(".new-registration--family-name-kana").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-family-name-kana").hide();
      $(".new-registration--family-name-kana").css("border","1px solid #ccc ");
    }
    //名(カタカナ)
    var personal_name_kana = $(".new-registration--personal-name-kana").val()
    if(personal_name_kana.length == 0) {
      $(".error-text-personal-name-kana").show();
      $(".new-registration--personal-name-kana").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-personal-name-kana").hide();
      $(".new-registration--personal-name-kana").css("border","1px solid #ccc ");
    }
    //生年月日
    var birthday = $(".new-registration--select").val()
    if(birthday.length == 0) {
      $(".error-text-birthday").show();
      $(".new-registration--select").css("border","1px solid #ea352d ");
      judge += 1;
    } else {
      $(".error-text-birthday").hide();
      $(".new-registration--select").css("border","1px solid #ccc ");
    }
    if(judge != 0) {
      e.preventDefault();
      $('body, html').animate({ scrollTop: 0 }, 1);
      return false;
    }
  })
})
