(function ($) {
  "use strict";

  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  Dropzone.autoDiscover = false;
  // Dropzone initialization
  var myDropzone = new Dropzone("#my-dropzone", {
    acceptedFiles: '.png, .jpg, .jpeg',
    maxFiles: galleryImages,
    url: storeUrl,
    success: function (file, response) {
      $("#sliders").append(`<input type="hidden" name="slider_images[]" id="slider${response.uniqueName}" value="${response.uniqueName}">`);

      // Create the remove button
      var removeButton = Dropzone.createElement("<button class='rmv-btn'><i class='fa fa-times'></i></button>");

      // Capture the Dropzone instance as closure.
      var _this = this;
      // Listen to the click event
      removeButton.addEventListener("click", function (e) {
        // Make sure the button click doesn't submit the form:
        e.preventDefault();
        e.stopPropagation();

        _this.removeFile(file);

        rmvimg(response.uniqueName);
      });

      // Add the button to the file preview element.
      file.previewElement.appendChild(removeButton);

      if (typeof response.error != 'undefined') {
        if (typeof response.file != 'undefined') {
          document.getElementById('errpreimg').innerHTML = response.file[0];
        }
      }
    }
  });

  function rmvimg(unqName) {
    // If you want to the delete the file on the server as well,
    // you can do the AJAX request here.
    $.ajax({
      url: removeUrl,
      type: 'POST',
      data: { 'imageName': unqName },
      success: function (data) {
        $(`[id="slider${unqName}"]`).remove();
      }
    });

  }



})(jQuery);
