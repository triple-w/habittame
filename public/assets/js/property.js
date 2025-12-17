'use strict'
$(document).ready(function() {


    $('.js-example-basic-single3').select2();
    $('.js-example-basic-single2').select2({
        placeholder: "Select Amenities",
    });


    $(".country").on('change', function(e) {
        $('.request-loader').addClass('show');
        let addedState = "state_id";
        let addedCity = "city_id";
        let id = $(this).val();

        $.ajax({
            type: 'GET',
            url: stateUrl,
            data: {
                id: id,
            },
            success: function(data) {
                if (data.states.length > 0) {
                    $('.state').show();
                    $('.city').hide()
                    $('.' + addedState).find('option').remove();
                    $('.' + addedCity).find('option').remove();
                    $.each(data.states, function(key, value) {

                        $('.' + addedState).append($(
                            `<option></option>`
                        ).val(value
                            .id).html(value.state_content.name));
                    });

                    let firstStateId = data.states[0].id;



                    $.ajax({
                        type: 'GET',
                        url: cityUrl,
                        data: {
                            state_id: firstStateId,
                        },
                        success: function(data) {

                            if (data.cities.length > 0) {
                                $('.city').show();
                                $('.' + addedCity).find('option').remove()
                                    .end();
                                $.each(data.cities, function(key, value) {
                                    $('.' + addedCity).append(
                                        $(
                                            `<option ></option>`
                                        ).val(value
                                            .id).html(value.city_content
                                            .name));
                                });
                            }
                            $('.request-loader').removeClass('show');
                        }
                    });

                } else if (data.cities.length > 0) {
                    $('.state').hide()
                    $('.city').show();
                    $('.' + addedCity).find('option').remove();
                    $.each(data.cities, function(key, value) {
                        $('.' + addedCity).append(
                            $(
                                `<option ></option>`
                            ).val(value
                                .id).html(value.city_content.name));
                    });
                }
                $('.request-loader').removeClass('show');
            }
        });
    });

    $(".vendor").on('change', function(e) {
        $('.request-loader').addClass('show');
        let id = $(this).val();

        $.ajax({
            type: 'GET',
            url: agentUrl,
            data: {
                vendor_id: id,
            },
            success: function(data) {
                if (data.agents.length > 0) {
                    $('.agent').removeClass('d-none');
                    $('.agent_id').html('<option selected value="">Please Select</option>');
                    $.each(data.agents, function(key, value) {

                        $('.agent_id').append($(
                            `<option></option>`
                        ).val(value
                            .id).html(value.username));
                    });
                } else {
                    $('.agent').addClass('d-none');
                }
                $('.request-loader').removeClass('show');
            }
        });
    });

});

function getCities(e) {

    let $this = e.target;
    $('.request-loader').addClass('show');
    let addedCity = "city_id";
    let id = $($this).val();
    $.ajax({
        type: 'GET',
        url: cityUrl,
        data: {
            state_id: id,
        },
        success: function(data) {
            if (data.cities.length > 0) {
                $('.city').show();
                $('.' + addedCity).find('option').remove().end();
                $.each(data.cities, function(key, value) {
                    $('.' + addedCity).append(
                        $(
                            `<option></option>`).val(value
                            .id).html(value.city_content.name));
                });
            } else {
                $('.' + addedCity).find('option').remove().end().append(
                    $(
                        `<option selected ></option>`).val('').html('No City Found'));
               
            }
            $('.request-loader').removeClass('show');
        }
    });
}
