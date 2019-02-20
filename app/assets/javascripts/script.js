$(document).on("turbolinks:load",function(){
  // 商品カテゴリー大 選択時の処理
  $("#first-select").change(function(){
    $("#hidden-form__wrapper").empty();
    $(".select-field__hidden").hide();
    if($("#first-select option:selected").text() == "---"){
    } else {
      // 親カテゴリー決定後の非同期通信
      function addSecondForm(categories) {
        var $hidden = $("#hidden-form__wrapper")
        $hidden.append(`<div id="hidden-form__second"><select class="product-detail__category select-field select-field__add" id="second-select" name="product[middle_category_id]"></select></div>`);
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
  // 配送料の負担 選択時の処理
  $("#which-charge").change(function(){
    if($(this).val() == "---"){
      $(".product-detail__how-to-delivery").val("---");
      $("#how-to-delivery").hide();
    } else {
      $("#how-to-delivery").show();
    }
  })
  // 非同期通信専用専用js
  var results = $("#search-results");
  // ブランド入力時のインクリメンタルサーチ
    $(document).on("keyup", "#brand-field", function(){
      function addHTML(brand) {
        var html = `<div class="search-result" data-id=${brand.id}>${brand.list}</div>`;
        results.append(html);
      }
      var $val = $(this).val();
      if($val != "") {
        // 非同期通信
        $.ajax({
          type: "get",
          url: "/brands/show",
          data: {keyword: $val},
          dataType: "json"
        })
        .done(function(data){
          results.empty();
          if(data.length != 0){
            data.forEach(function(brand){
              addHTML(brand);
            })
          }
        })
        .fail(function(){
          alert("失敗")
        })
      } else {
        results.empty();
      }
    });
  $(document).on("click", ".search-result", function(){
    selected_brand_name = $(this).html();
    selected_brand_id = $(this).attr("data-id");
    var new_html = `<input type="text" class="product-detail__brand text-field" placeholder="例）ヤムル" id="brand-field" value="${selected_brand_name}"">
    <input type="hidden" name="product[brand_id]" value=${selected_brand_id}>`
    $("#brand-field").remove();
    $("#brand-result").append(new_html);
    results.empty();
  })
  // 販売手数料の計算
  $("#price-field").keyup(function(){
    if($(this).val() == "") {
      $("#tax-field").html("-");
      $("#profit-field").html("-");
    }
    var $price = $(this).val();
    var tax = Math.floor($price * 0.1);
    var profit = $price - tax;
    var numberWithComma = new Intl.NumberFormat();
    $("#tax-field").html("¥" + numberWithComma.format(tax));
    $("#profit-field").html("¥" + numberWithComma.format(profit));
  })
})
// 商品カテゴリー中 選択時の処理
$(document).on("change", "#second-select", function(){
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
