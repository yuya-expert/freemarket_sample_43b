$(document).on("turbolinks:load",function(){
  $("#search-category").change(function(){
    if($(this).val() == ""){
      $("#search-category__child").empty();
    } else {
      // 子カテゴリーのhtml定義
      function addCategory (categories) {
        var html = `<select class="select-field search-contents__second" id="second_category" name="product[category_id]"></select>`;
        $("#search-category__child").html(html);
        var default_select = `<option value="">すべて</option>`
        $("#second_category").append(default_select);
        categories.forEach(function(category){
          var option = `<option value=${category.id}>${category.name}</option>`;
          $("#second_category").append(option);
        });
      }
      // 親カテゴリー選択時の非同期通信
      var $id = $("#search-category option:selected").val();
      $.ajax({
        type: "post",
        url: "/products/search_category",
        data: {id: $id},
        dataType: "json"
      })
      .done(function(data){
        addCategory(data);
      })
      .fail(function(){
        alert("カテゴリー検索に失敗しました。");
      });
    }
  })
})
