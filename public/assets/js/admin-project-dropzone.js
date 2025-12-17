(function ($) {
  "use strict";

  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  // gallery Dropzone initialization
  Dropzone.options.myDropzone = {
    acceptedFiles: '.png, .jpg, .jpeg',
    url: galleryStoreUrl,
    maxFiles: galleryImages,
    success: function (file, response) {
      $("#galleries").append(`<input type="hidden" name="gallery_images[]" id="galleries${response.file_id}" value="${response.file_id}">`);

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

        rmvimg(response.file_id);
      });

      // Add the button to the file preview element.
      file.previewElement.appendChild(removeButton);

      if (typeof response.error != 'undefined') {
        if (typeof response.file != 'undefined') {
          document.getElementById('errpreimg').innerHTML = response.file[0];
        }
      }
    }
  };

  function rmvimg(fileid) {
    // If you want to the delete the file on the server as well,
    // you can do the AJAX request here.
    $.ajax({
      url: galleryRemoveUrl,
      type: 'POST',
      data: {
        fileid: fileid
      },
      success: function (data) {
        $("#galleries" + fileid).remove();

      }
    });

  }

  // Floor Palaning Dropzone initialization
  Dropzone.options.myDropzone2 = {
    acceptedFiles: '.png, .jpg, .jpeg',
    url: floorPlanStoreUrl,
    success: function (file, response) {
      $("#floorPlan").append(`<input type="hidden" name="floor_plan_images[]" id="floorPlan${response.file_id}" value="${response.file_id}">`);

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

        floorPlaninrmvimg(response.file_id);
      });

      // Add the button to the file preview element.
      file.previewElement.appendChild(removeButton);

      if (typeof response.error != 'undefined') {
        if (typeof response.file != 'undefined') {
          document.getElementById('errpreimg').innerHTML = response.file[0];
        }
      }
    }
  };


  function floorPlaninrmvimg(fileid) {
    // If you want to the delete the file on the server as well,
    // you can do the AJAX request here.
    $.ajax({
      url: floorPlanRemoveUrl,
      type: 'POST',
      data: {
        fileid: fileid
      },
      success: function (data) {
        $("#floorPlan" + fileid).remove();

      }
    });

  }


  //remove existing gallery images
  $(document).on('click', '.rmvbtndb', function () {
    let indb = $(this).data('indb');
    $(".request-loader").addClass("show");
    $.ajax({
      url: galleryImagRrmvdbUrl,
      type: 'POST',
      data: {
        fileid: indb
      },
      success: function (data) {

        var content = {};
        if (data == 'false') {
          content.message = "You can't delete all images.!!";
          content.title = 'Warning';
          var type = 'warning';
        } else {
          $("#trdb" + indb).remove();
          content.message = 'Gallery image deleted successfully!';
          content.title = 'Success';
          var type = 'success';
          location.reload();
        }
        $(".request-loader").removeClass("show");
        content.icon = 'fa fa-bell';

        $.notify(content, {
          type: type,
          placement: {
            from: 'top',
            align: 'right'
          },
          showProgressbar: true,
          time: 1000,
          delay: 4000
        });
      }
    });
  });

  //remove existing gallery images
  $(document).on('click', '.rmvbtndb2', function () {
    let indb = $(this).data('indb');
    $(".request-loader").addClass("show");
    $.ajax({
      url: floorPlanRmvdbUrl,
      type: 'POST',
      data: {
        fileid: indb
      },
      success: function (data) {

        var content = {};
        if (data == 'false') {
          content.message = "You can't delete all images.!!";
          content.title = 'Warning';
          var type = 'warning';
        } else {
          $("#trdb" + indb).remove();
          content.message = 'Floor plan image deleted successfully!';
          content.title = 'Success';
          var type = 'success';
          location.reload();
        }
        $(".request-loader").removeClass("show");
        content.icon = 'fa fa-bell';

        $.notify(content, {
          type: type,
          placement: {
            from: 'top',
            align: 'right'
          },
          showProgressbar: true,
          time: 1000,
          delay: 4000
        });
      }
    });
  });

})(jQuery);
