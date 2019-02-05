// 非同期通信専用専用js
$(function(){
  var $results = $("#search-results");

  // ブランド入力時のインクリメンタルサーチ
  $("#brand-field").keyup(function(){
    function addHTML(brand) {
      var html = `<div class="search-result">${brand.list}</div>`;
      $results.append(html);
    }
    var $val = $(this).val();
    console.log($val);
    if($val != "") {
      // 非同期通信
      $.ajax({
        type: "get",
        url: "/brands/show",
        data: {keyword: $val},
        dataType: "json"
      })
      .done(function(data){
        $results.empty();
        console.log(data);
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
      $results.empty();
    }
  });
  $(document).on("click", ".search-result", function(){
    $selected_brand = $(this).html();
    $("#brand-field").val($selected_brand);
    $results.empty();
  })
})
