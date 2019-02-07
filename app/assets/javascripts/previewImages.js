$(function(){
  function buildHTML(image){
    var preview = `<li class="preview">
                      <div class="preview-file">
                        <img src=${image} >
                      </div>
                      <div class="preview-delete">
                        <a href="" id="delete-btn" class="preview-delete--btn">削除</a>
                      </div>
                  </li>
                  `;
    return preview;
  }

  function addPreview(file){
    reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(e){
      return function(e){
        var image = e.target.result;
        var preview = buildHTML(image);
        $('.image-preview--lists').append(preview);
      };
    })(file);
    reader.readAsDataURL(file);
  }

  $(".product-image__upload").change('input[type="file"]',function(event){
    var file = event.target.files[0];
    addPreview(file);
  });

  window.addEventListener('dragover', function(event) {
      event.preventDefault();
  }, false);

  window.addEventListener('drop', function(event) {
    event.preventDefault();
    var file = event.dataTransfer.files[0];
    addPreview(file);
  });

  $(document).on("click",'#delete-btn',function(e){
    e.preventDefault();
    $(this).parents('.preview').remove();
  })

  $('.image-preview--lists').on('DOMSubtreeModified propertychange',function(){
    var text = $('p');
    var field = $('.product-image__upload');
    const threePictures = 3;
    const fourPictures = 4;
    if($('li').length == threePictures){
      field.show();
      text.hide();
    }else if($('li').length === fourPictures){
      field.hide();
    }
    else{
      text.show();
      field.show();
    }
  })
});
