function featuredRequest(e) {
  let selectedValue = $('#' + e.id).val();
  let propertyId = $('#' + e.id).data('property')
  if (selectedValue == 1) {
    $('#featuredRequest').modal('show');
    $('#in_property_id').val(propertyId);

  }

}

$(document).ready(function () {
  $('#stripe-element').addClass('d-none');
})

$(document).ready(function () {

  $('select[name="gateway"]').change(function () {
    $('.offline-gateway-info').addClass('d-none');
    var selectedPaymentMethod = $(this).children("option:selected").val();

    let value = $(this).val();
    let dataType = parseInt(value);
    if (selectedPaymentMethod == "stripe") {
      $('#stripe-element').removeClass('d-none');

      $('#authorize-net-input').removeClass('d-block');
      $('#authorize-net-input').addClass('d-none');
      $('.offline-gateway-info').addClass('d-none');

    } else if (selectedPaymentMethod == "authorize.net") {

      $('#stripe-element').addClass('d-none');
      $('#authorize-net-input').removeClass('d-none');
      $('.offline-gateway-info').addClass('d-none');
    } else {
      $('#offline-gateway-' + value).removeClass('d-none');
      $('#stripe-element').addClass('d-none');
      $('#authorize-net-input').addClass('d-none');
    }
  });








});



//stripe init start
if (!!stripe_key) {
  // Set your Stripe public key
  var stripe = Stripe(stripe_key);

  // Create a Stripe Element for the card field
  var elements = stripe.elements();
  var cardElement = elements.create('card', {
    style: {
      base: {
        iconColor: '#454545',
        color: '#454545',
        fontWeight: '500',
        lineHeight: '50px',
        fontSmoothing: 'antialiased',
        backgroundColor: '#f2f2f2',
        ':-webkit-autofill': {
          color: '#454545',
        },
        '::placeholder': {
          color: '#454545',
        },
      }
    },
  });

  // Add an instance of the card Element into the `card-element` div
  cardElement.mount('#stripe-element');

  // Handle form submission
  var form = document.getElementById('my-checkout-form');
  // form.addEventListener('submit', function (event) {


  // Send the token to your server
  function stripeTokenHandler(token) {
    // Add the token to the form data before submitting to the server
    var form = document.getElementById('my-checkout-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    // Submit the form to your server 
    $(".request-loader").addClass("show");
    form.submit();
  }

}
//stripe init start end


$(document).ready(function () {
  $("#payment").on('click', function (e) {
    e.preventDefault();
    let val = $("#payment-gateway").val();
    if (val == null) {



      let content = {};
      content.message = 'Please select payment method';
      content.title = 'Warning!';
      content.icon = 'fa fa-bell';
      $.notify(content, {
        type: 'warning',
        placement: {
          from: 'top',
          align: 'right'
        },
        showProgressbar: true,
        time: 1000,
        delay: 4000
      });


      return;
    }
    if (val == 'authorize.net') {
      sendPaymentDataToAnet();
    } else if (val == 'stripe') {
      stripe.createToken(cardElement).then(function (result) {
        if (result.error) {
          // Display errors to the customer
          var errorElement = document.getElementById('stripe-errors');
          errorElement.textContent = result.error.message;

        } else {
          // Send the token to your server
          stripeTokenHandler(result.token);
        }
      });
    } else {
      $(".request-loader").addClass("show");
      $("#my-checkout-form").submit();
    }
  });
});

function sendPaymentDataToAnet() {
  // Set up authorisation to access the gateway.
  var authData = {};
  authData.clientKey = clientKey;
  authData.apiLoginID = apiLoginID;

  var cardData = {};
  cardData.cardNumber = document.getElementById("anetCardNumber").value;
  cardData.month = document.getElementById("anetExpMonth").value;
  cardData.year = document.getElementById("anetExpYear").value;
  cardData.cardCode = document.getElementById("anetCardCode").value;

  // Now send the card data to the gateway for tokenization.
  // The responseHandler function will handle the response.
  var secureData = {};
  secureData.authData = authData;
  secureData.cardData = cardData;
  Accept.dispatchData(secureData, responseHandler);
}

function responseHandler(response) {
  if (response.messages.resultCode === "Error") {
    var i = 0;
    let errorLists = ``;
    while (i < response.messages.message.length) {
      errorLists += `<li class="text-danger">${response.messages.message[i].text}</li>`;

      i = i + 1;
    }
    $("#anetErrors").show();
    $("#anetErrors").html(errorLists);
  } else {
    paymentFormUpdate(response.opaqueData);
  }
}

function paymentFormUpdate(opaqueData) {
  document.getElementById("opaqueDataDescriptor").value = opaqueData.dataDescriptor;
  document.getElementById("opaqueDataValue").value = opaqueData.dataValue;
  $(".request-loader").addClass("show");
  document.getElementById("my-checkout-form").submit();
}


$(document).ready(function () {
  $("#paymentAdmin").on('click', function (e) {
    e.preventDefault();
    let val = $("#payment-gateway").val();
    if (val == null) {



      let content = {};
      content.message = 'Please select payment method';
      content.title = 'Warning!';
      content.icon = 'fa fa-bell';
      $.notify(content, {
        type: 'warning',
        placement: {
          from: 'top',
          align: 'right'
        },
        showProgressbar: true,
        time: 1000,
        delay: 4000
      });


      return;
    }
    if (val == 'authorize.net') {
      document.getElementById("my-checkout-form").submit();
      // sendPaymentDataToAnet();
    } else if (val == 'stripe') {
      // stripe.createToken(cardElement).then(function (result) {
      //   if (result.error) {
      //     // Display errors to the customer
      //     var errorElement = document.getElementById('stripe-errors');
      //     errorElement.textContent = result.error.message;

      //   } else {
      //     // Send the token to your server
      //     stripeTokenHandler(result.token);
      //   }
      // });
      document.getElementById("my-checkout-form").submit();
    } else {
      $(".request-loader").addClass("show");
      $("#my-checkout-form").submit();
    }
  });
});
