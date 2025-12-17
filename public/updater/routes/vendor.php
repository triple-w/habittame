<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| vendor Interface Routes
|--------------------------------------------------------------------------
*/

Route::prefix('vendor')
    ->middleware('change.lang')
    ->group(function () {
        Route::get('/dashboard', 'Vendor\VendorController@index')->name('vendor.index');
        Route::get('/signup', 'Vendor\VendorController@signup')->name('vendor.signup')->middleware('guest:vendor');
        Route::post('/signup/submit', 'Vendor\VendorController@create')->name('vendor.signup_submit');
        Route::get('/login', 'Vendor\VendorController@login')->name('vendor.login')->middleware('guest:vendor');
        Route::post('/login/submit', 'Vendor\VendorController@authentication')->name('vendor.login_submit');

        Route::get('/email/verify', 'Vendor\VendorController@confirm_email');

        Route::get('/forget-password', 'Vendor\VendorController@forget_passord')->name('vendor.forget.password');
        Route::post('/send-forget-mail', 'Vendor\VendorController@forget_mail')->name('vendor.forget.mail');
        Route::get('/reset-password', 'Vendor\VendorController@reset_password')->name('vendor.reset.password');
        Route::post('/update-forget-password', 'Vendor\VendorController@update_password')->name('vendor.update-forget-password');
    });

Route::prefix('vendor')
    ->middleware('auth:vendor', 'Deactive')
    ->group(function () {
        Route::get('dashboard', 'Vendor\VendorController@dashboard')->name('vendor.dashboard');
        Route::get('/change-password', 'Vendor\VendorController@change_password')->name('vendor.change_password');
        Route::post('/update-password', 'Vendor\VendorController@updated_password')->name('vendor.update_password');
        Route::get('/edit-profile', 'Vendor\VendorController@edit_profile')->name('vendor.edit.profile');
        Route::post('/profile/update', 'Vendor\VendorController@update_profile')->name('vendor.update_profile');
        Route::get('/logout', 'Vendor\VendorController@logout')->name('vendor.logout');

        // change admin-panel theme (dark/light) route
        Route::post('/change-theme', 'Vendor\VendorController@changeTheme')->name('vendor.change_theme');
        Route::get('/payment-log', 'Vendor\VendorController@payment_log')->name('vendor.payment_log');

        //vendor package extend route
        Route::get('/package-list', 'Vendor\BuyPlanController@index')->name('vendor.plan.extend.index');
        Route::get('/package/checkout/{package_id}', 'Vendor\BuyPlanController@checkout')->name('vendor.plan.extend.checkout');
        Route::post('/package/checkout', 'Vendor\VendorCheckoutController@checkout')->name('vendor.plan.checkout');

        Route::post('/payment/instructions', 'Vendor\VendorCheckoutController@paymentInstruction')->name('vendor.payment.instructions');

        //checkout payment gateway routes
        Route::prefix('membership')->group(function () {
            Route::get('paypal/success', 'Payment\PaypalController@successPayment')->name('membership.paypal.success');
            Route::get('paypal/cancel', 'Payment\PaypalController@cancelPayment')->name('membership.paypal.cancel');
            Route::get('stripe/cancel', 'Payment\StripeController@cancelPayment')->name('membership.stripe.cancel');
            Route::post('paytm/payment-status', 'Payment\PaytmController@paymentStatus')->name('membership.paytm.status');
            Route::get('paystack/success', 'Payment\PaystackController@successPayment')->name('membership.paystack.success');
            Route::post('mercadopago/cancel', 'Payment\paymenMercadopagoController@cancelPayment')->name('membership.mercadopago.cancel');
            Route::get('mercadopago/success', 'Payment\MercadopagoController@successPayment')->name('membership.mercadopago.success');
            Route::post('razorpay/success', 'Payment\RazorpayController@successPayment')->name('membership.razorpay.success');
            Route::post('razorpay/cancel', 'Payment\RazorpayController@cancelPayment')->name('membership.razorpay.cancel');
            Route::get('instamojo/success', 'Payment\InstamojoController@successPayment')->name('membership.instamojo.success');
            Route::post('instamojo/cancel', 'Payment\InstamojoController@cancelPayment')->name('membership.instamojo.cancel');
            Route::post('flutterwave/success', 'Payment\FlutterWaveController@successPayment')->name('membership.flutterwave.success');
            Route::post('flutterwave/cancel', 'Payment\FlutterWaveController@cancelPayment')->name('membership.flutterwave.cancel');
            Route::get('/mollie/success', 'Payment\MollieController@successPayment')->name('membership.mollie.success');
            Route::post('mollie/cancel', 'Payment\MollieController@cancelPayment')->name('membership.mollie.cancel');
            Route::get('anet/cancel', 'Payment\AuthorizeController@cancelPayment')->name('membership.anet.cancel');

            Route::get('midtrans/success/{id}', 'Payment\MidtransController@cardNotify')->name('membership.midtrans.success');
            Route::get('midtrans/cancel', 'Payment\MidtransController@cancelPayment')->name('membership.midtrans.cancel');
            Route::post('/iyzico/success', 'Payment\IyzicoController@successPayment')->name('membership.iyzico.success');
            Route::get('iyzico/cancel', 'Payment\IyzicoController@cancelPayment')->name('membership.iyzico.cancel');
            Route::post('/paytabs/success', 'Payment\PaytabsController@successPayment')->name('membership.paytabs.success');
            Route::get('paytabs/cancel', 'Payment\PaytabsController@cancelPayment')->name('membership.paytabs.cancel');
            Route::get('/toyyibpay/success', 'Payment\ToyyibpayController@successPayment')->name('membership.toyyibpay.success');
            Route::get('toyyibpay/cancel', 'Payment\ToyyibpayController@cancelPayment')->name('membership.toyyibpay.cancel');
            Route::any('/phonepe/success', 'Payment\PhonePeController@successPayment')->name('membership.phonepe.success');
            Route::get('phonepe/cancel', 'Payment\PhonePeController@cancelPayment')->name('membership.phonepe.cancel');
            Route::any('/yoco/success', 'Payment\YocoController@successPayment')->name('membership.yoco.success');
            Route::get('yoco/cancel', 'Payment\YocoController@cancelPayment')->name('membership.yoco.cancel');
          
            Route::get('/xendit/success', 'Payment\XenditController@successPayment')->name('membership.xendit.success');
            Route::get('xendit/cancel', 'Payment\XenditController@cancelPayment')->name('membership.xendit.cancel');
            Route::get('/perfect_money/success', 'Payment\PerfectMoneyController@successPayment')->name('membership.perfect_money.success');
            Route::get('perfect_money/cancel', 'Payment\PerfectMoneyController@cancelPayment')->name('membership.perfect_money.cancel');

            Route::get('/offline/success', 'Front\CheckoutController@offlineSuccess')->name('membership.offline.success');
            Route::get('/trial/success', 'Front\CheckoutController@trialSuccess')->name('membership.trial.success');

            Route::get('/online/success', 'Vendor\VendorCheckoutController@onlineSuccess')->name('success.page');
        });

        Route::middleware('vendorHasPackage')->group(function () {
            Route::prefix('property-management')->group(function () {
                Route::get('/properties', 'Vendor\PropertyController@index')->name('vendor.property_management.properties');
                Route::get('/type', 'Vendor\PropertyController@type')->name('vendor.property_management.type');
                Route::get('/create', 'Vendor\PropertyController@create')->name('vendor.property_management.create_property');
                Route::post('/store', 'Vendor\PropertyController@store')->name('vendor.property_management.store_property')->middleware('packageLimitsCheck:property,store');
                Route::post('specification/delete', 'Vendor\PropertyController@specificationDelete')->name('vendor.property_management.specification_delete');

                Route::post('/update_featured', 'Vendor\PropertyController@updateFeatured')->name('vendor.property_management.update_featured');
                Route::post('update_status', 'Vendor\PropertyController@updateStatus')->name('vendor.property_management.update_status');
                Route::get('edit-property/{id}', 'Vendor\PropertyController@edit')->name('vendor.property_management.edit');
                Route::post('update/{id}', 'Vendor\PropertyController@update')->name('vendor.property_management.update_property')->middleware('packageLimitsCheck:property,update');
                Route::post('delete', 'Vendor\PropertyController@delete')->name('vendor.property_management.delete_property');
                Route::post('bulk-delete', 'Vendor\PropertyController@bulkDelete')->name('vendor.property_management.bulk_delete_property');
                //#========== Property slider image
                Route::post('/img-store', 'Vendor\PropertyController@imagesstore')->name('vendor.property.imagesstore')->middleware('packageLimitsCheck:property,store');
                Route::post('/img-update', 'Vendor\PropertyController@imagesstore')->name('vendor.property.imagesupdate')->middleware('packageLimitsCheck:property,update');
                Route::post('/img-remove', 'Vendor\PropertyController@imagermv')->name('vendor.property.imagermv');
                Route::post('/img-db-remove', 'Vendor\PropertyController@imagedbrmv')->name('vendor.property.imgdbrmv');
                //#==========property slider image end

                Route::get('/get-states-cities', 'Vendor\PropertyController@getStateCities')->name('vendor.property_specification.get_state_cities');
                Route::get('/get-cities', 'Vendor\PropertyController@getCities')->name('vendor.property_specification.get_cities');

                Route::get('/request-to-featured', 'Vendor\PropertyController@requestTofeature')->name('vendor.property_management.request_to_feature');

                Route::post('/featured/payment', 'Vendor\FeaturedProperty\PaymentController@makePayment')->name('vendor.property_management.featured_payment');

                Route::get('/featured/payment/success', 'Vendor\FeaturedProperty\PaymentController@onlineSuccess')->name('vendor.property_management.featured_payment_success');

                Route::get('/featured/paypal/notify', 'Vendor\FeaturedProperty\Payment\PaypalController@notify')->name('vendor.featured.paypal.notify');
                Route::get('/featured/paypal/cancle', 'Vendor\FeaturedProperty\Payment\PaypalController@cancelPayment')->name('vendor.featured.paypal.cancle');

                Route::get('/featured/instamojo/notify', 'Vendor\FeaturedProperty\Payment\InstamojoController@notify')->name('vendor.featured.instamojo.notify');
                Route::get('/featured/instamojo/cancle', 'Vendor\FeaturedProperty\Payment\InstamojoController@cancelPayment')->name('vendor.featured.instamojo.cancle');

                Route::get('/featured/paystack/notify', 'Vendor\FeaturedProperty\Payment\PaystackController@notify')->name('vendor.featured.paystack.notify');
                Route::get('/featured/paystack/cancle', 'Vendor\FeaturedProperty\Payment\PaystackController@cancelPayment')->name('vendor.featured.paystack.cancle');

                Route::post('/featured/flutterwave/notify', 'Vendor\FeaturedProperty\Payment\FlutterWaveController@notify')->name('vendor.featured.flutterwave.notify');
                Route::get('/featured/flutterwave/notify', 'Vendor\FeaturedProperty\Payment\FlutterWaveController@cancelPayment')->name('vendor.featured.flutterwave.cancle');

                Route::post('/featured/razorpay/notify', 'Vendor\FeaturedProperty\Payment\RazorpayController@notify')->name('vendor.featured.razorpay.notify');
                Route::get('/featured/razorpay/cancle', 'Vendor\FeaturedProperty\Payment\RazorpayController@cancelPayment')->name('vendor.featured.razorpay.cancle');

                Route::get('/featured/mercadopago/notify', 'Vendor\FeaturedProperty\Payment\MercadopagoController@notify')->name('vendor.featured.mercadopago.notify');
                Route::get('/featured/mercadopago/cacnle', 'Vendor\FeaturedProperty\Payment\MercadopagoController@cancelPayment')->name('vendor.featured.mercadopago.cancle');

                Route::get('/featured/mollie/notify', 'Vendor\FeaturedProperty\Payment\MollieController@notify')->name('vendor.featured.mollie.notify');
                Route::get('/featured/mollie/cancle', 'Vendor\FeaturedProperty\Payment\MollieController@cancelPayment')->name('vendor.featured.mollie.cancle');

                Route::post('/featured/paytm/notify', 'Vendor\FeaturedProperty\Payment\PaytmController@notify')->name('vendor.featured.paytm.notify');
            });

            // property messages
            Route::get('/messages', 'Vendor\PropertyMessageController@index')->name('vendor.property_message.index');
            Route::post('/message-delete', 'Vendor\PropertyMessageController@destroy')->name('vendor.property_message.delete');

            // Project Management route start
            Route::prefix('project-management')->group(function () {
                Route::get('/projects', 'Vendor\Project\ProjectController@index')->name('vendor.project_management.projects');
                Route::get('/create', 'Vendor\Project\ProjectController@create')->name('vendor.project_management.create_project');

                Route::post('/store', 'Vendor\Project\ProjectController@store')->name('vendor.project_management.store_project')->middleware('packageLimitsCheck:project,store');
                Route::post('/update_featured', 'Vendor\Project\ProjectController@updateFeatured')->name('vendor.project_management.update_featured');
                Route::post('update_status', 'Vendor\Project\ProjectController@updateStatus')->name('vendor.project_management.update_status');
                Route::get('edit-project/{id}', 'Vendor\Project\ProjectController@edit')->name('vendor.project_management.edit');
                Route::post('update/{id}', 'Vendor\Project\ProjectController@update')->name('vendor.project_management.update_project')->middleware('packageLimitsCheck:project,update');
                Route::post('specification/delete', 'Vendor\Project\ProjectController@specificationDelete')->name('vendor.project_management.specification_delete');
                Route::post('/delete', 'Vendor\Project\ProjectController@destroy')->name('vendor.project_management.delete_project');
                Route::post('/bulk-delete', 'Vendor\Project\ProjectController@bulkDestroy')->name('vendor.project_management.bulk_delete_project');
                //#========== project gallery image
                Route::post('/gallery-img-store', 'Vendor\Project\ProjectController@galleryImagesStore')->name('vendor.project.gallery_image_store')->middleware('packageLimitsCheck:project,update');
                Route::post('/img-remove', 'Vendor\Project\ProjectController@galleryImageRmv')->name('vendor.project.gallery_imagermv');
                Route::post('/img-db-remove', 'Vendor\Project\ProjectController@galleryImageDbrmv')->name('vendor.project.gallery_imgdbrmv');
                //#========== project slider image end

                //#========== project gallery image
                Route::post('/floor-plan-img-store', 'Vendor\Project\ProjectController@floorPlanImagesStore')->name('vendor.project.floor_plan_image_store');
                Route::post('/floor-plan-img-remove', 'Vendor\Project\ProjectController@floorPlanImageRmv')->name('vendor.project.floor_plan_imagermv');
                Route::post('/floor-plan-img-db-remove', 'Vendor\Project\ProjectController@floorPlanImageDbrmv')->name('vendor.project.floor_plan_imgdbrmv');
                //#========== project slider image end

                // Project type routes
                Route::prefix('type')->group(function () {
                    Route::get('/{id}', 'Vendor\Project\TypeController@index')->name('vendor.project_management.project_types');
                    Route::post('/store', 'Vendor\Project\TypeController@store')->name('vendor.project_management.project_type.store')->middleware('packageLimitsCheck:projectType,store');
                    Route::post('/update', 'Vendor\Project\TypeController@update')->name('vendor.project_management.project_type.update')->middleware('packageLimitsCheck:projectType,update');
                    Route::post('/delete', 'Vendor\Project\TypeController@delete')->name('vendor.project_management.delete_type');
                    Route::post('/bulk-delete', 'Vendor\Project\TypeController@bulkDelete')->name('vendor.project_management.bulk_delete_type');
                });
            });
            // Project Management Route End

            Route::prefix('agent-management')->group(function () {
                Route::get('/', 'Vendor\AgentController@index')->name('vendor.agent_management.index');
                Route::post('/store', 'Vendor\AgentController@store')->name('vendor.agent_management.register')->middleware('packageLimitsCheck:agent,store');
                Route::post('/update', 'Vendor\AgentController@update')->name('vendor.agent_management.update_agent')->middleware('packageLimitsCheck:agent,update');
                Route::post('/update-status/{id}', 'Vendor\AgentController@changeStatus')->name('vendor.agent_management.change_status')->middleware('packageLimitsCheck:agent,update');
                Route::get('/secret-login/{id}', 'Vendor\AgentController@secret_login')->name('vendor.agent_management.secret_login');
                Route::post('/{id}/delete', 'Vendor\AgentController@destroy')->name('vendor.agent_management.destroy');
            });

            #====support tickets ============
            Route::get('support/ticket/create', 'Vendor\SupportTicketController@create')->name('vendor.support_ticket.create');
            Route::post('support/ticket/store', 'Vendor\SupportTicketController@store')->name('vendor.support_ticket.store');
            Route::get('support/tickets', 'Vendor\SupportTicketController@index')->name('vendor.support_tickets');
            Route::get('support/message/{id}', 'Vendor\SupportTicketController@message')->name('vendor.support_tickets.message');
            Route::post('support-ticket/zip-upload', 'Vendor\SupportTicketController@zip_file_upload')->name('vendor.support_ticket.zip_file.upload');
            Route::post('support-ticket/reply/{id}', 'Vendor\SupportTicketController@ticketreply')->name('vendor.support_ticket.reply');

            Route::post('support-ticket/delete/{id}', 'Vendor\SupportTicketController@delete')->name('vendor.support_tickets.delete');
        });
    });
