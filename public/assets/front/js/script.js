!(function ($) {
    "use strict";

    /*============================================
        Sticky header
    ============================================*/
    $(window).on("scroll", function () {
        var header = $(".header-area");
        // If window scroll down .is-sticky class will added to header
        if ($(window).scrollTop() >= 100) {
            header.addClass("is-sticky");
        } else {
            header.removeClass("is-sticky");
        }
    });


    /*============================================
        Mobile menu
    ============================================*/
    var mobileMenu = function () {
        // Variables
        var body = $("body"),
            mainNavbar = $(".main-navbar"),
            mobileNavbar = $(".mobile-menu"),
            cloneInto = $(".mobile-menu-wrapper"),
            cloneItem = $(".mobile-item"),
            menuToggler = $(".menu-toggler"),
            offCanvasMenu = $("#offcanvasMenu"),
            backdrop,
            _initializeBackDrop = function () {
                backdrop = document.createElement('div');
                backdrop.className = 'menu-backdrop';
                backdrop.onclick = function hideOffCanvas() {
                    menuToggler.removeClass("active"),
                        body.removeClass("mobile-menu-active"),
                        backdrop.remove();
                };
                document.body.appendChild(backdrop);
            };

        menuToggler.on("click", function () {
            $(this).toggleClass("active");
            body.toggleClass("mobile-menu-active");
            _initializeBackDrop();
            if (!body.hasClass("mobile-menu-active")) {
                $('.menu-backdrop').remove();
            }
        })

        mainNavbar.find(cloneItem).clone(!0).appendTo(cloneInto);

        if (offCanvasMenu) {
            body.find(offCanvasMenu).clone(!0).appendTo(cloneInto);
        }

        mobileNavbar.find("li").each(function (index) {
            var toggleBtn = $(this).children(".toggle")
            toggleBtn.on("click", function (e) {
                $(this)
                    .parent("li")
                    .children("ul")
                    .stop(true, true)
                    .slideToggle(350);
                $(this).parent("li").toggleClass("show");
            })
        })

        // check browser width in real-time
        var checkBreakpoint = function () {
            var winWidth = window.innerWidth;
            if (winWidth <= 1199) {
                mainNavbar.hide();
                mobileNavbar.show()
            } else {
                mainNavbar.show();
                mobileNavbar.hide();
                $('.menu-backdrop').remove();
            }
        }
        checkBreakpoint();

        $(window).on('resize', function () {
            checkBreakpoint();
        });
    }
    mobileMenu();

    var getHeaderHeight = function () {
        var headerNext = $(".header-next");
        var header = headerNext.prev(".header-area");
        var headerHeight = header.height();

        headerNext.css({
            "margin-top": headerHeight
        })
    }
    getHeaderHeight();

    $(window).on('resize', function () {
        getHeaderHeight();
    });


    /*============================================
        Image to background image
    ============================================*/
    $(".bg-img").parent().addClass('blur-up lazyload');

    $(".bg-img").each(function () {
        var el = $(this);
        var src = el.attr("src");
        var parent = el.parent();
        if (typeof src != 'undefined') {
            parent.css({
                "background-image": "url(" + src + ")",
                "background-size": "cover",
                "background-position": "center",
                "display": "block"
            });
        }

        el.hide();
    });



    /*============================================
        Price range
    ============================================*/


    var range_slider_max = document.getElementById('min');
    if (range_slider_max) {
        var sliders = document.querySelectorAll("[data-range-slider='priceSlider']");
        var filterSliders = document.querySelectorAll("[data-range-slider='filterPriceSlider']");
        var filterSliders2 = document.querySelectorAll("[data-range-slider='filterPriceSlider2']");
        var input0 = document.getElementById('min1');
        var input1 = document.getElementById('max1');

        var input20 = document.getElementById('min2');
        var input21 = document.getElementById('max2');

        var min = document.getElementById('min').value;
        var max = document.getElementById('max').value;

        var o_min = document.getElementById('o_min').value;
        var o_max = document.getElementById('o_max').value;

        // var c_min = document.getElementsByClassName('minval');
        // var c_max = document.getElementsByClassName('maxval');

        var currency_symbol = document.getElementById('currency_symbol').value;
        var min = parseFloat(min);
        var max = parseFloat(max);

        var o_min = parseFloat(o_min);
        var o_max = parseFloat(o_max);
        var inputs = [input0, input1];
        var inputs2 = [input20, input21];
        // Home price slider
        for (let i = 0; i < sliders.length; i++) {
            const el = sliders[i];

            noUiSlider.create(el, {
                start: [min, max],
                connect: true,
                step: 10,
                margin: 0,
                range: {
                    'min': o_min,
                    'max': o_max
                }
            }), el.noUiSlider.on("end", function (values, handle) {

                $("[data-range-value='priceSliderValue']").text(currency_symbol + values.join(" - " + currency_symbol));

                inputs[handle].value = values[handle];
                updateURL('min=' + values[0]);
                updateURL('max=' + values[1]);
            })
        }
        // Filter price slider
        if (filterSliders) {
            for (let i = 0; i < filterSliders.length; i++) {
                const fsl = filterSliders[i];

                noUiSlider.create(fsl, {

                    start: [min, max],
                    connect: !0,
                    step: 10,
                    margin: 40,
                    range: {
                        'min': o_min,
                        'max': o_max
                    }
                }), fsl.noUiSlider.on("update", function (values, handle) {
                    $("[data-range-value='filterPriceSliderValue']").text(currency_symbol + values.join(" - " + currency_symbol));

                    inputs[handle].value = values[handle];
                }), fsl.noUiSlider.on("change", function (values, handle) {

                    $("[data-range-value='filterPriceSliderValue']").text(currency_symbol + values.join(" - " + currency_symbol));
                    inputs[handle].value = values[handle];
                }),

                    inputs.forEach(function (input, handle) {
                        if (input) {
                            input.addEventListener('change', function () {
                                fsl.noUiSlider.setHandle(handle, this.value);
                            });
                        }
                    });
            }
        }


        // Filter price slider 2
        if (filterSliders2) {
            for (let i = 0; i < filterSliders2.length; i++) {
                const fsl2 = filterSliders2[i];

                noUiSlider.create(fsl2, {

                    start: [min, max],
                    connect: !0,
                    step: 10,
                    margin: 40,
                    range: {
                        'min': o_min,
                        'max': o_max
                    }
                }), fsl2.noUiSlider.on("update", function (values, handle) {
                    $("[data-range-value='filterPriceSlider2Value']").text(currency_symbol + values.join(" - " + currency_symbol));

                    inputs2[handle].value = values[handle];
                }), fsl2.noUiSlider.on("change", function (values, handle) {

                    $("[data-range-value='filterPriceSlider2Value']").text(currency_symbol + values.join(" - " + currency_symbol));
                    inputs2[handle].value = values[handle];
                }),

                    inputs2.forEach(function (input, handle) {
                        if (input) {
                            input.addEventListener('change', function () {
                                fsl2.noUiSlider.setHandle(handle, this.value);
                            });
                        }
                    });

            }
        }
    }












    /*============================================
        Sidebar toggle
    ============================================*/
    $(".category-toggle").on("click", function (t) {
        var i = $(this).closest("li"),
            o = i.find("ul").eq(0);

        if (i.hasClass("open")) {
            o.slideUp(300, function () {
                i.removeClass("open")
            })
        } else {
            o.slideDown(300, function () {
                i.addClass("open")
            })
        }
        t.stopPropagation(), t.preventDefault()
    })

    /*============================================
        Sliders
    ============================================*/

    // Home Slider
    var homeSlider1 = new Swiper("#home-slider-1", {
        loop: true,
        speed: 1000,
        grabCursor: true,
        slidesPerView: 1,
        autoplay: true,

        pagination: {
            el: "#home-slider-1-pagination",
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '">' + "0" + (index + 1) + "</span>";
            },
        },
    })
    var homeImageSlider1 = new Swiper("#home-img-slider-1", {
        loop: true,
        speed: 1000,
        grabCursor: true,
        effect: "fade",
        slidesPerView: 1
    });
    // Sync both slider
    homeImageSlider1.controller.control = homeSlider1;
    homeSlider1.controller.control = homeImageSlider1;

    // Category Slider
    var categorySlider1 = new Swiper("#category-slider-1", {
        speed: 400,
        loop: false,
        slidesPerView: 6,
        spaceBetween: 24,

        // Navigation arrows
        navigation: {
            nextEl: '.cat-slider-btn-next',
            prevEl: '.cat-slider-btn-prev',
        },

        breakpoints: {
            0: {
                slidesPerView: 1
            },
            576: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 4
            },
            1200: {
                slidesPerView: 6
            }
        }
    })
    var categorySlider2 = new Swiper("#category-slider-2", {
        speed: 400,
        loop: false,
        slidesPerView: 6,
        spaceBetween: 24,
        pagination: true,

        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },

        breakpoints: {
            0: {
                slidesPerView: 1
            },
            576: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 4
            },
            1200: {
                slidesPerView: 6
            }
        }
    })

    // Featured Slider
    var featuredSlider = new Swiper(".product-slider", {
        speed: 400,
        spaceBetween: 24,
        loop: false,
        pagination: true,

        pagination: {
            el: "#product-slider-pagination",
            clickable: true,
        },

        // Navigation arrows
        navigation: {
            nextEl: '.product-slider-btn-next',
            prevEl: '.product-slider-btn-prev',
        },

        breakpoints: {
            0: {
                slidesPerView: 1
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1400: {
                slidesPerView: 4
            }
        }
    });

    // Agent Slider
    var agentSlider = new Swiper(".agent-slider", {
        speed: 400,
        spaceBetween: 30,
        loop: false,

        breakpoints: {
            0: {
                slidesPerView: 1
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1200: {
                slidesPerView: 3
            }
        }
    });

    // Agent Slider2
    var agentSlider2 = new Swiper(".agent-slider-two", {
        speed: 400,
        spaceBetween: 30,
        loop: false,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            0: {
                slidesPerView: 1
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1200: {
                slidesPerView: 3
            }
        }
    });

    // testimonial Slider
    var testimonialSlider = new Swiper("#testimonial-slider-1", {
        speed: 400,
        spaceBetween: 30,
        loop: true,
        slidesPerView: 2,

        // Navigation arrows
        navigation: {
            nextEl: '.slider-btn-next',
            prevEl: '.slider-btn-prev',
        },

        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 1
            },
            // when window width is >= 400px
            992: {
                slidesPerView: 2
            }
        }
    });
    var testimonialSlider2 = new Swiper("#testimonial-slider-2", {
        speed: 400,
        spaceBetween: 30,
        loop: true,
        slidesPerView: 2,
        pagination: true,

        pagination: {
            el: "#testimonial-slider-2-pagination",
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '">' + "0" + (index + 1) + "</span>";
            },
        },

        breakpoints: {
            320: {
                slidesPerView: 1
            },
            768: {
                slidesPerView: 2
            }
        }
    });
    var testimonialSlider3 = new Swiper("#testimonial-slider-3", {
        speed: 400,
        spaceBetween: 30,
        loop: true,
        slidesPerView: 3,
        pagination: true,

        pagination: {
            el: "#testimonial-slider-3-pagination",
            clickable: true
        },

        breakpoints: {
            320: {
                slidesPerView: 1
            },
            768: {
                slidesPerView: 2
            },
            1200: {
                slidesPerView: 3
            }
        }
    });

    // Product single slider
    var proSingleThumbs = new Swiper(".slider-thumbnails", {
        loop: true,
        spaceBetween: 20,
        slidesPerView: 3
    });
    var proSingleSlider = new Swiper(".product-single-slider", {
        loop: false,
        spaceBetween: 30,
        // Navigation arrows
        navigation: {
            nextEl: ".slider-btn-next",
            prevEl: ".slider-btn-prev",
        },
        thumbs: {
            swiper: proSingleThumbs,
        },
    });

    // Sponsor Slider
    var sponsorSlider = new Swiper(".sponsor-slider", {
        speed: 400,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: "#sponsor-slider-pagination",
            clickable: true,
        },
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 1,
                spaceBetween: 20
            },
            // when window width is >= 400px
            400: {
                slidesPerView: 2,
                spaceBetween: 10
            },
            // when window width is >= 640px
            768: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            // when window width is >= 640px
            1200: {
                slidesPerView: 4,
                spaceBetween: 30
            }
        }
    });


    /*============================================
        Pricing toggle
    ============================================*/
    $("#toggleSwitch").on("change", function (event) {
        if (event.currentTarget.checked) {
            $("#yearly").addClass("active");
            $("#monthly").removeClass("active");
        } else {
            $("#monthly").addClass("active");
            $("#yearly").removeClass("active");
        }
    })


    /*============================================
        Pricing show more toggle
    ============================================*/
    $(".pricing-list").each(function (i) {
        var list = $(this).children();

        if (list.length > 4) {
            this.insertAdjacentHTML('afterEnd', '<span class="show-more">Show More</span>');
            const showLink = $(this).next(".show-more");

            list.slice(4).toggle(300);

            showLink.on("click", function () {
                list.slice(4).toggle(300);

                showLink.html(showLink.html() === "Show More" ? "Show Less" : "Show More")
            })
        }
    })


    /*============================================
        Masonry gallery
    ============================================*/
    var $grid = $('.masonry-gallery.grid').masonry({
        itemSelector: '.grid-item',
        percentPosition: true,
        columnWidth: '.grid-sizer'
    });
    // layout Masonry after each image loads
    $grid.imagesLoaded().progress(function () {
        $grid.masonry('layout');
    });
    $(".tabs-navigation .nav-link").on("click", function () {
        $grid.masonry('layout');
    })


    /*============================================
        Quantity Button
    ============================================*/
    $(document).on("click", ".quantity-down", function () {
        var numProduct = Number($(this).next().val());
        if (numProduct > 0) $(this).next().val(numProduct - 1);
    });
    $(document).on("click", ".quantity-up", function () {
        var numProduct = Number($(this).prev().val());
        $(this).prev().val(numProduct + 1);
    });


    /*============================================
        Password icon toggle
    ============================================*/
    $(".show-password-field").on("click", function () {
        var showIcon = $(this).children(".show-icon");
        var passwordField = $(this).prev("input");
        showIcon.toggleClass("show");
        if (passwordField.attr("type") == "password") {
            passwordField.attr("type", "text")
        } else {
            passwordField.attr("type", "password");
        }
    })


    /*============================================
        Magnific popup
    ============================================*/
    // Product Single Popup
    $(".lightbox-single").magnificPopup({
        type: "image",
        mainClass: 'mfp-with-zoom',
        gallery: {
            enabled: true
        }
    });

    // Gallery popup
    $(".gallery-popup").each(function () {
        $(this).magnificPopup({
            delegate: 'a',
            type: 'image',
            mainClass: 'mfp-fade',
            gallery: {
                enabled: true,
                navigateByImgClick: true,
                preload: [0, 1]
            },
            image: {
                tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
            },
            callbacks: {
                elementParse: function (item) {
                    // the class name
                    if (item.el.hasClass("video-link")) {
                        item.type = 'iframe';
                    } else {
                        item.type = 'image';
                    }
                }
            },
            removalDelay: 500, //delay removal by X to allow out-animation
            closeOnContentClick: true,
            midClick: true
        });
    })

    // Youtube Popup
    $(".youtube-popup").magnificPopup({
        disableOn: 300,
        type: "iframe",
        mainClass: "mfp-fade",
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    })



    /*============================================
        Scroll Top
    ============================================*/
    $(window).on("scroll", function () {
        // If window scroll down .active class will added to go-top
        var goTop = $(".go-top");

        if ($(window).scrollTop() >= 200) {
            goTop.addClass("active");
        } else {
            goTop.removeClass("active")
        }
    })
    $(".go-top").on("click", function (e) {
        $("html, body").animate({
            scrollTop: 0,
        }, 0);
    });


    /*============================================
       Lazyload images
    ============================================*/
    var lazyLoad = function () {
        window.lazySizesConfig = window.lazySizesConfig || {};
        window.lazySizesConfig.loadMode = 2;
        lazySizesConfig.preloadAfterLoad = true;
    }


    /*============================================
        Tooltip
    ============================================*/
    var tooltipTriggerList = [].slice.call($('[data-tooltip="tooltip"]'))

    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })


    /*============================================
        Nice-select
    ============================================*/
    $(".nice-select").niceSelect();
    $('.select2').select2();

    // Odometer
    $(".counter").counterUp({
        delay: 10,
        time: 1000
    });


    /*============================================
        Data tables
    ============================================*/
    var dataTable = function () {
        var dTable = $("#myTable");

        if (dTable.length) {
            dTable.DataTable()
        }
    }


    /*============================================
        Curve text
    ============================================*/
    var curveText = function () {
        var text = document.getElementById("curveText");

        if (text) {
            text.innerHTML = text.textContent.replace(/\S/g, "<span class='char'>$&</span>");
            var el = document.querySelectorAll(".char")

            for (let i = 0; i < el.length; i++) {
                el[i].style.transform = "rotate(" + i * 16.5 + "deg)"
            }
        }
    }


    /*============================================
        Image upload
    ============================================*/
    var fileReader = function (input) {
        var regEx = new RegExp(/\.(gif|jpe?g|tiff?|png|webp|bmp)$/i);
        var errorMsg = $("#errorMsg");

        if (input.files && input.files[0] && regEx.test(input.value)) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            errorMsg.html("Please upload a valid file type")
        }
    }
    $("#imageUpload").on("change", function () {
        fileReader(this);
    });


    /*============================================
        Footer date
    ============================================*/
    var date = new Date().getFullYear();
    $("#footerDate").text(date);


    /*============================================
        Document on ready
    ============================================*/
    $(document).ready(function () {
        lazyLoad(),
            dataTable(),
            curveText()
    })

    $(".country").on('change', function (e) {
        $('.request-loader').addClass('show');
        let addedState = "state_id";
        let addedCity = "city_id";
        let id = $(this).find(':selected').data('id');
        let stateUrl = baseURL + '/state-cities'

        $.ajax({
            type: 'GET',
            url: stateUrl,
            data: {
                id: id,
            },
            success: function (data) {
                if (data.states.length > 0) {
                    $('.state').show();
                    $('.city').hide()
                    $('.' + addedState).find('option').remove();
                    $('.' + addedCity).find('option').remove();
                    $('.' + addedState).append($(
                        `<option data-id="0"></option>`).val('all').html('All'));
                    $.each(data.states, function (key, value) {

                        $('.' + addedState).append($(
                            `<option data-id="${value.id}"></option>`
                        ).val(value
                            .state_content.name).html(value.state_content.name));
                    });

                    let firstStateId = data.states[0].id;



                    $.ajax({
                        type: 'GET',
                        url: baseURL + '/cities',
                        data: {
                            state_id: firstStateId,
                        },
                        success: function (data) {
                            if (data.cities.length > 0) {
                                $('.city').show();
                                $('.' + addedCity).find('option').remove()
                                    .end();
                                $('.' + addedCity).append($(
                                    `<option data-id="0"></option>`).val('all').html('All'));
                                $.each(data.cities, function (key, value) {
                                    $('.' + addedCity).append(
                                        $(
                                            `<option data-id="${value.id}"></option>`
                                        ).val(value.city_content.name).html(value.city_content
                                            .name));
                                });
                            }
                            $('.request-loader').removeClass('show');
                        }
                    });

                } else if (data.cities.length > 0) {
                    $('.state').hide()
                    $('.city').show();
                    $('.' + addedCity).find('option').remove()
                    $('.' + addedCity).append($(
                        `<option data-id="0"></option>`).val('all').html('All'));
                    $.each(data.cities, function (key, value) {
                        $('.' + addedCity).append(
                            $(
                                `<option data-id="${value.id}"></option>`
                            ).val(value
                                .city_content.name).html(value.city_content.name));
                    });
                } else if (data.states.length == 0 && data.cities.length == 0) {
                    $('.state').hide()
                    $('.city').hide();
                }
                $('.request-loader').removeClass('show');
            }
        });
    });


    // add user email for subscription
    $('.subscriptionForm').on('submit', function (event) {
        event.preventDefault();
        let formURL = $(this).attr('action');
        let formMethod = $(this).attr('method');

        let formData = new FormData($(this)[0]);

        $.ajax({
            url: formURL,
            method: formMethod,
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (response) {
                $('input[name="email_id"]').val('');
                toastr[response.alert_type](response.message)
                toastr.options = {
                    "closeButton": true,
                    "progressBar": true,
                    "timeOut ": 10000,
                    "extendedTimeOut": 10000,
                    "positionClass": "toast-top-right",
                }
            },
            error: function (errorData) {
                toastr['error'](errorData.responseJSON.error.email_id[0]);
            }
        });
    });

    $(".type").on('change', function (e) {
        $('.request-loader').addClass('show');
        let value = $(this).find(':selected').val();

        $.ajax({
            type: 'GET',
            url: baseURL + '/categories',
            data: {
                type: value,
            },
            success: function (data) {
                if (data.categories.length > 0) {
                    $('.bringCategory').find('option').remove();
                    $.each(data.categories, function (key, value) {

                        $('.bringCategory').append($(
                            `<option></option>`
                        ).val(value.category_content.slug).html(value.category_content.name));
                    });

                }
                $('.request-loader').removeClass('show');
            }
        });
    });


})(jQuery);

$(window).on("load", function () {
    const delay = 350;

    /*============================================
    Preloader
    ============================================*/
    $("#preLoader").delay(delay).fadeOut('slow');

    /*============================================
        Aos animation
    ============================================*/
    var aosAnimation = function () {
        AOS.init({
            easing: "ease",
            duration: 1500,
            once: true,
            offset: 60,
            disable: 'mobile'
        });
    }
    if ($("#preLoader")) {
        setTimeout(() => {
            aosAnimation()
        }, delay);
    } else {
        aosAnimation();
    }
})
