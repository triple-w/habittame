
$(document).ready(function () {
  'use strict';

  $('.js-example-basic-single3').select2();
  if (countryStatus == false && stateStatus == true) {
    $('#state').show();
  } else {
    $('#state').hide();
  }
  $("#country").on('change', function (e) {
    $('.request-loader').addClass('show');

    let id = $(this).val();

    $.ajax({
      type: 'GET',
      url: stateUrl,
      data: {
        id: id,
      },
      success: function (data) {
        if (data.length != 0) {
          $('#state').show()
          $('[name="state"]').html('');
          $('[name="state"]').append($(
            '<option selected disabled value=""> Select a State </option>'
          ));
          $.each(data, function (key, value) {
            $('[name="state"]').append($('<option></option>').val(
              value.id)
              .html(value.state_content
                .name));
          });
        } else {
          $('#state').hide();
        }
        $('.request-loader').removeClass('show');
      }
    });
  });
});
