$(function(){
  // 商品カテゴリー大 選択時の処理
  $("#first-select").change(function(){
    $("#hidden-form__wrapper").empty();
    $(".select-field__hidden").hide();
    if($("#first-select option:selected").text() == "---"){
    } else {
      // 親カテゴリー決定後の非同期通信
      function addSecondForm(categories) {
        var $hidden = $("#hidden-form__wrapper")
        $hidden.append(`<div id="hidden-form__second"><select class="product-detail__category select-field select-field__add" id="second-select" name="product[category_id]"></select></div>`);
        var $select = $("#second-select");
        var html_unselect = `<option value="">---</option>`;
        $select.append(html_unselect);
        categories.forEach(function(category){
          var html = `<option value=${category.id}>${category.name}</option>`;
          $select.append(html);
        });
      };
      var $id = $("#first-select option:selected").val();
      $.ajax({
        type: "post",
        url: "/products/search_category",
        data: {id: $id},
        dataType: "json"
      })
      .done(function(data){
        addSecondForm(data);
      })
      .fail(function(){
        alert("カテゴリー検索に失敗しました。");
      });
    }
  });
  // ここまでがsecond-form追加
  $(document).on("change", "#second-select", function(){
    // 商品カテゴリー中 選択時の処理
    $("#hidden-form__third").remove();
    if($("#second-select option:selected").text() == "---"){
    } else {
      // 親カテゴリー決定後の非同期通信
      function addThirdForm(categories) {
        var $hidden = $("#hidden-form__wrapper")
        $hidden.append(`<div id="hidden-form__third"><select class="product-detail__category select-field select-field__add" id="third-select" name="product[category_id]"></select></div>`);
        var $select = $("#third-select");
        var html_unselect = `<option value="">---</option>`;
        $select.append(html_unselect);
        categories.forEach(function(category){
          var html = `<option value=${category.id}>${category.name}</option>`;
          $select.append(html);
        });
      };
      var $id = $("#second-select option:selected").val();
      $.ajax({
        type: "post",
        url: "/products/search_category",
        data: {id: $id},
        dataType: "json"
      })
      .done(function(data){
        addThirdForm(data);
      })
      .fail(function(){
        alert("カテゴリー検索に失敗しました。");
      });
    }
  });
  // ここまでがthird-form追加
  $(document).on("change", "#third-select", function(){
    $("#size-select").show();
    $("#brand-select").show();
  })
  // 配送料の負担 選択時の処理
  $("#which-charge").change(function(){
    if($(this).val() == "---"){
      $(".product-detail__how-to-delivery").val("---");
      $("#how-to-delivery").hide();
    } else {
      $("#how-to-delivery").show();
    }
  })
})
