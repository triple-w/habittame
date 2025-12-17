<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ __('Package Purchase via Midtrans') }}</title>
    <link rel="shortcut icon" href="{{ asset('assets/img/' . $websiteInfo->favicon) }}" type="image/x-icon">
</head>

<body>
    <button class="btn btn-primary" id="pay-button" style="display: none">{{ __('Pay Now') }}</button>
    <script src="{{ asset('assets/admin/js/jquery-3.7.1.min.js') }}"></script>
    @if ($is_production == 0)
    <script src="https://app.midtrans.com/snap/snap.js" data-client-key="{{ $client_key }}"></script>
    @else
    <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ $client_key }}"></script>
    @endif
    
    <script>
        var successUrlTemplate = "{{ route('membership.midtrans.success', ['id' => 'ORDER_ID_PLACEHOLDER']) }}";
        var cancelUrl = "{{ route('membership.midtrans.cancel') }}";
        
        $(document).ready(function() {
            $('#pay-button').trigger('click');
        })
        const payButton = document.querySelector('#pay-button');
        payButton.addEventListener('click', function(e) {
            e.preventDefault();

            snap.pay('{{ $snapToken }}', {
                // Optional
                onSuccess: function(result) {
                    let orderId = result.order_id;

                    let successUrl = successUrlTemplate.replace('ORDER_ID_PLACEHOLDER', orderId);
                    window.location.href = successUrl;
                },
                // Optional
                onPending: function(result) {
                    window.location.href = cancelUrl;
                },
                // Optional
                onError: function(result) {
                    window.location.href = cancelUrl;
                }
            });
        });
        </script>
</body>

</html>
