<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Admin Panel Routes
|--------------------------------------------------------------------------
*/


Route::prefix('/admin')->middleware('auth:admin')->group(function () {
  // admin redirect to dashboard route
  Route::get('/dashboard', 'BackEnd\AdminController@redirectToDashboard')->name('admin.dashboard');
  Route::get('/membership-request', 'BackEnd\AdminController@membershipRequest')->name('admin.membership-request');
  Route::post('/membership-request/update/{id}', 'BackEnd\AdminController@membershipRequestUpdate')->name('admin.payment-log.update');

  // change admin-panel theme (dark/light) route
  Route::get('/change-theme', 'BackEnd\AdminController@changeTheme')->name('admin.change_theme');

  // admin profile settings route start
  Route::get('/edit-profile', 'BackEnd\AdminController@editProfile')->name('admin.edit_profile');

  Route::post('/update-profile', 'BackEnd\AdminController@updateProfile')->name('admin.update_profile');

  Route::get('/change-password', 'BackEnd\AdminController@changePassword')->name('admin.change_password');

  Route::post('/update-password', 'BackEnd\AdminController@updatePassword')->name('admin.update_password');
  // admin profile settings route end

  // admin logout attempt route
  Route::get('/logout', 'BackEnd\AdminController@logout')->name('admin.logout');

  // menu-builder route start
  Route::prefix('/menu-builder')->middleware('permission:Menu Builder')->group(function () {
    Route::get('', 'BackEnd\MenuBuilderController@index')->name('admin.menu_builder');

    Route::post('/update-menus', 'BackEnd\MenuBuilderController@update')->name('admin.menu_builder.update_menus');
  });
  // menu-builder route end

  // Payment Log
  Route::get('/payment-log', 'BackEnd\PaymentLogController@index')->name('admin.payment-log.index');
  Route::post('/payment-log/update', 'BackEnd\PaymentLogController@update')->name('admin.payment-log.update');

  Route::prefix('package')->group(function () {
    // Package Settings routes
    Route::get('/settings', 'BackEnd\PackageController@settings')->name('admin.package.settings');
    Route::post('/settings', 'BackEnd\PackageController@updateSettings')->name('admin.package.settings');
    // Package routes
    Route::get('packages', 'BackEnd\PackageController@index')->name('admin.package.index');
    Route::post('package/upload', 'BackEnd\PackageController@upload')->name('admin.package.upload');
    Route::post('package/store', 'BackEnd\PackageController@store')->name('admin.package.store');
    Route::get('package/{id}/edit', 'BackEnd\PackageController@edit')->name('admin.package.edit');
    Route::post('package/update', 'BackEnd\PackageController@update')->name('admin.package.update');
    Route::post('package/featured', 'BackEnd\PackageController@featured')->name('admin.package.featured');
    Route::post('package/{id}/uploadUpdate', 'BackEnd\PackageController@uploadUpdate')->name('admin.package.uploadUpdate');
    Route::post('package/delete', 'BackEnd\PackageController@delete')->name('admin.package.delete');
    Route::post('package/bulk-delete', 'BackEnd\PackageController@bulkDelete')->name('admin.package.bulk.delete');
  });
  Route::prefix('featured-pricing')->group(function () {
    Route::get('/', 'BackEnd\FeaturedPricingController@index')->name('admin.featured_pricing.index');
    Route::post('/store', 'BackEnd\FeaturedPricingController@store')->name('admin.featured_pricing.store');
    Route::get('/{id}/edit', 'BackEnd\FeaturedPricingController@edit')->name('admin.featured_pricing.edit');
    Route::post('/update', 'BackEnd\FeaturedPricingController@update')->name('admin.featured_pricing.update');
    Route::post('/delete', 'BackEnd\FeaturedPricingController@destroy')->name('admin.featured_pricing.delete');
  });


  Route::get('featured-request', 'BackEnd\FeaturedPricingController@requestedForFeatured')->name('admin.requested_for_featured');
  Route::post('change-featured-status', 'BackEnd\FeaturedPricingController@changeFeaturedStatus')->name('admin.edit_featured_status');
  Route::post('change-featured-payment-status', 'BackEnd\FeaturedPricingController@changeFeaturedPaymentStatus')->name('admin.update_featured_payment_status');
  Route::post('delete-request', 'BackEnd\FeaturedPricingController@deleteFeturedRequest')->name('admin.delete_featured_request');



  //property spacification
  Route::prefix('property-specification')->group(function () {
    // property category route
    Route::get('/settings', 'BackEnd\Property\PropertyController@settings')->name('admin.property_specification.settings');
    Route::post('/update-settings', 'BackEnd\Property\PropertyController@update_settings')->name('admin.property_specification.update_settings');
    Route::get('/categories', 'BackEnd\Property\CategoryController@index')->name('admin.property_specification.categories');
    Route::post('/store-category', 'BackEnd\Property\CategoryController@store')->name('admin.property_specification.store_category');
    Route::post('/update-category', 'BackEnd\Property\CategoryController@update')->name('admin.property_specification.update_category');
    Route::post('/update-category-featured', 'BackEnd\Property\CategoryController@updateFeatured')->name('admin.property_specification.update_category_featured');

    Route::post('/delete-category', 'BackEnd\Property\CategoryController@destroy')->name('admin.property_specification.delete_category');
    Route::post('/bulk-delete-category', 'BackEnd\Property\CategoryController@bulkDestroy')->name('admin.property_specification.bulk_delete_category');

    // property Amenities route
    Route::get('/amenity', 'BackEnd\Property\AmenityController@index')->name('admin.property_specification.amenities');
    Route::post('/store-amenity', 'BackEnd\Property\AmenityController@store')->name('admin.property_specification.store_amenity');
    Route::post('/update-amenity', 'BackEnd\Property\AmenityController@update')->name('admin.property_specification.update_amenity');
    Route::post('/delete-amenity', 'BackEnd\Property\AmenityController@destroy')->name('admin.property_specification.delete_amenity');
    Route::post('/bulk-delete-amenity', 'BackEnd\Property\AmenityController@bulkDestroy')->name('admin.property_specification.bulk_delete_amenity');

    // property cities route
    Route::get('/cities', 'BackEnd\Property\CityController@index')->name('admin.property_specification.cities');
    Route::get('/get-cities', 'BackEnd\Property\CityController@getCities')->name('admin.property_specification.get_cities');
    Route::post('/store-city', 'BackEnd\Property\CityController@store')->name('admin.property_specification.store_city');
    Route::post('/update-city', 'BackEnd\Property\CityController@update')->name('admin.property_specification.update_city');
    Route::post('/update-featured', 'BackEnd\Property\CityController@updateFeatured')->name('admin.property_specification.update_featured');
    Route::post('/delete-city', 'BackEnd\Property\CityController@destroy')->name('admin.property_specification.delete_city');
    Route::post('/bulk-delete-city', 'BackEnd\Property\CityController@bulkDestroy')->name('admin.property_specification.bulk_delete_city');

    // property countries route
    Route::get('/country', 'BackEnd\Property\CountryController@index')->name('admin.property_specification.countries');
    Route::post('/store-country', 'BackEnd\Property\CountryController@store')->name('admin.property_specification.store_country');
    Route::post('/update-country', 'BackEnd\Property\CountryController@update')->name('admin.property_specification.update_country');

    Route::post('/delete-country', 'BackEnd\Property\CountryController@destroy')->name('admin.property_specification.delete_country');
    Route::post('/bulk-delete-country', 'BackEnd\Property\CountryController@bulkDestroy')->name('admin.property_specification.bulk_delete_country');

    // property countries route
    Route::get('/states', 'BackEnd\Property\StateController@index')->name('admin.property_specification.states');
    Route::get('/get-state', 'BackEnd\Property\StateController@getState')->name('admin.property_specification.get_state');
    Route::get('/get-states-cities', 'BackEnd\Property\StateController@getStateCities')->name('admin.property_specification.get_state_cities');
    Route::post('/store-state', 'BackEnd\Property\StateController@store')->name('admin.property_specification.store_state');
    Route::post('/update-state', 'BackEnd\Property\StateController@update')->name('admin.property_specification.update_state');


    Route::post('/delete-state', 'BackEnd\Property\StateController@destroy')->name('admin.property_specification.delete_state');
    Route::post('/bulk-delete-state', 'BackEnd\Property\StateController@bulkDestroy')->name('admin.property_specification.bulk_delete_state');
  });


  Route::prefix('property-management')->group(function () {
    Route::get('/settings', 'BackEnd\Property\PropertyController@propertSettings')->name('admin.property_management.settings');
    Route::get('/properties', 'BackEnd\Property\PropertyController@index')->name('admin.property_management.properties');
    Route::get('/type', 'BackEnd\Property\PropertyController@type')->name('admin.property_management.type');
    Route::get('/create', 'BackEnd\Property\PropertyController@create')->name('admin.property_management.create_property');
    Route::get('/get-agent', 'BackEnd\Property\PropertyController@getAgent')->name('admin.property_management.get_agent');
    Route::post('/store', 'BackEnd\Property\PropertyController@store')->name('admin.property_management.store_property')->middleware('AdminCheckVendorPackage:property,store');
    Route::post('/update_featured', 'BackEnd\Property\PropertyController@updateFeatured')->name('admin.property_management.update_featured');
    Route::post('update_status', 'BackEnd\Property\PropertyController@updateStatus')->name('admin.property_management.update_status');
    Route::post('approve-status', 'BackEnd\Property\PropertyController@approveStatus')->name('admin.property_management.approve_status');
    Route::get('edit-property/{id}', 'BackEnd\Property\PropertyController@edit')->name('admin.property_management.edit');
    Route::post('update/{id}', 'BackEnd\Property\PropertyController@update')->name('admin.property_management.update_property')->middleware('AdminCheckVendorPackage:property,update');
    Route::post('specification/delete', 'BackEnd\Property\PropertyController@specificationDelete')->name('admin.property_management.specification_delete');
    Route::post('/featured-payment', 'BackEnd\Property\PropertyController@featuredPayment')->name('admin.property_management.featured_payment');
    //#========== Property slider image
    Route::post('/img-store', 'BackEnd\Property\PropertyController@imagesstore')->name('admin.property.imagesstore')->middleware('AdminCheckVendorPackage:property,store');
    Route::post('/img-update', 'BackEnd\Property\PropertyController@imagesstore')->name('admin.property.imagesupdate')->middleware('AdminCheckVendorPackage:property,update');
    Route::post('/img-remove', 'BackEnd\Property\PropertyController@imagermv')->name('admin.property.imagermv');
    Route::post('/img-db-remove', 'BackEnd\Property\PropertyController@imagedbrmv')->name('admin.property.imgdbrmv');

    //#==========property slider image end

    Route::post('delete', 'BackEnd\Property\PropertyController@delete')->name('admin.property_management.delete_property');
    Route::post('bulk-delete', 'BackEnd\Property\PropertyController@bulkDelete')->name('admin.property_management.bulk_delete_property');
  });

  // Project Management route start
  Route::prefix('project-management')->group(function () {

    Route::get('/settings', 'BackEnd\Project\ProjectController@settings')->name('admin.project_management.settings');
    Route::post('/update-settings', 'BackEnd\Project\ProjectController@updateSettings')->name('admin.project_management.update_settings');
    Route::get('/projects', 'BackEnd\Project\ProjectController@index')->name('admin.project_management.projects');
    Route::get('/create', 'BackEnd\Project\ProjectController@create')->name('admin.project_management.create_project');

    Route::post('/store', 'BackEnd\Project\ProjectController@store')->name('admin.project_management.store_project')->middleware('AdminCheckVendorPackage:project,store');
    Route::post('/update_featured', 'BackEnd\Project\ProjectController@updateFeatured')->name('admin.project_management.update_featured');
    Route::post('update_status', 'BackEnd\Project\ProjectController@updateStatus')->name('admin.project_management.update_status');
    Route::post('approve-status', 'BackEnd\Project\ProjectController@approveStatus')->name('admin.project_management.approve_status');
    Route::get('edit-project/{id}', 'BackEnd\Project\ProjectController@edit')->name('admin.project_management.edit');
    Route::post('update/{id}', 'BackEnd\Project\ProjectController@update')->name('admin.project_management.update_project')->middleware('AdminCheckVendorPackage:project,update');
    Route::post('specification/delete', 'BackEnd\Project\ProjectController@specificationDelete')->name('admin.project_management.specification_delete');

    Route::post('/delete', 'BackEnd\Project\ProjectController@destroy')->name('admin.project_management.delete_project');
    Route::post('/bulk-delete', 'BackEnd\Project\ProjectController@bulkDestroy')->name('admin.project_management.bulk_delete_project');

    //#========== project gallery image

    Route::post('/gallery-img-store', 'BackEnd\Project\ProjectController@galleryImagesStore')->name('admin.project.gallery_image_store')->middleware('AdminCheckVendorPackage:project,update');
    Route::post('/img-remove', 'BackEnd\Project\ProjectController@galleryImageRmv')->name('admin.project.gallery_imagermv');
    Route::post('/img-db-remove', 'BackEnd\Project\ProjectController@galleryImageDbrmv')->name('admin.project.gallery_imgdbrmv');
    //#========== project slider image end

    //#========== project gallery image
    Route::post('/floor-plan-img-store', 'BackEnd\Project\ProjectController@floorPlanImagesStore')->name('admin.project.floor_plan_image_store');
    Route::post('/floor-plan-img-remove', 'BackEnd\Project\ProjectController@floorPlanImageRmv')->name('admin.project.floor_plan_imagermv');
    Route::post('/floor-plan-img-db-remove', 'BackEnd\Project\ProjectController@floorPlanImageDbrmv')->name('admin.project.floor_plan_imgdbrmv');
    //#========== project slider image end

    // Project type routes
    Route::prefix('type')->group(function () {
      Route::get('/{id}', 'BackEnd\Project\TypeController@index')->name('admin.project_management.project_types');
      Route::post('/store', 'BackEnd\Project\TypeController@store')->name('admin.project_management.project_type.store')->middleware('AdminCheckVendorPackage:projectType,store');
      Route::post('/update', 'BackEnd\Project\TypeController@update')->name('admin.project_management.project_type.update')->middleware('AdminCheckVendorPackage:projectType,update');
      Route::post('/delete', 'BackEnd\Project\TypeController@delete')->name('admin.project_management.delete_type');
      Route::post('/bulk-delete', 'BackEnd\Project\TypeController@bulkDelete')->name('admin.project_management.bulk_delete_type');
    });
  });
  // Project Management Route End
  // property messages
  Route::get('/property-messages', 'BackEnd\Property\PropertyMessageController@index')->name('admin.property_message.index');
  Route::post('/message-delete', 'BackEnd\Property\PropertyMessageController@destroy')->name('admin.property_message.destroy');
  // agent Management
  Route::prefix('agent-management')->group(function () {
    Route::get('/', 'BackEnd\AgentController@index')->name('admin.agent_management.index');
    Route::post('/store', 'BackEnd\AgentController@store')->name('admin.agent_management.register');
    Route::post('/update', 'BackEnd\AgentController@update')->name('admin.agent_management.update_agent');
    Route::post('/update-status/{id}', 'BackEnd\AgentController@changeStatus')->name('admin.agent_management.change_status');
    Route::get('/secret-login/{id}', 'BackEnd\AgentController@secret_login')->name('admin.agent_management.secret_login');
    Route::post('/{id}/delete', 'BackEnd\AgentController@destroy')->name('admin.agent_management.destroy');
  });

  // user management route start
  Route::prefix('/user-management')->middleware('permission:User Management')->group(function () {
    // registered user route
    Route::get('/registered-users', 'BackEnd\User\UserController@index')->name('admin.user_management.registered_users');

    Route::get('/create', 'BackEnd\User\UserController@create')->name('admin.user_management.registered_user.create');
    Route::post('/store', 'BackEnd\User\UserController@store')->name('admin.user_management.registered_user.store');

    Route::prefix('/user/{id}')->group(function () {

      Route::get('/edit', 'BackEnd\User\UserController@edit')->name('admin.user_management.registered_user.edit');
      Route::post('/update', 'BackEnd\User\UserController@update')->name('admin.user_management.registered_user.update');

      Route::post('/update-account-status', 'BackEnd\User\UserController@updateAccountStatus')->name('admin.user_management.user.update_account_status');

      Route::post('/update-email-status', 'BackEnd\User\UserController@updateEmailStatus')->name('admin.user_management.user.update_email_status');

      Route::get('/change-password', 'BackEnd\User\UserController@changePassword')->name('admin.user_management.user.change_password');

      Route::post('/update-password', 'BackEnd\User\UserController@updatePassword')->name('admin.user_management.user.update_password');

      Route::post('/delete', 'BackEnd\User\UserController@destroy')->name('admin.user_management.user.delete');
      Route::get('/secret-login', 'BackEnd\User\UserController@secret_login')->name('admin.user_management.user.secret-login');
    });

    Route::post('/bulk-delete-user', 'BackEnd\User\UserController@bulkDestroy')->name('admin.user_management.bulk_delete_user');

    // subscriber route
    Route::get('/subscribers', 'BackEnd\User\SubscriberController@index')->name('admin.user_management.subscribers');

    Route::post('/subscriber/{id}/delete', 'BackEnd\User\SubscriberController@destroy')->name('admin.user_management.subscriber.delete');

    Route::post('/bulk-delete-subscriber', 'BackEnd\User\SubscriberController@bulkDestroy')->name('admin.user_management.bulk_delete_subscriber');

    Route::get('/mail-for-subscribers', 'BackEnd\User\SubscriberController@writeEmail')->name('admin.user_management.mail_for_subscribers');

    Route::post('/subscribers/send-email', 'BackEnd\User\SubscriberController@prepareEmail')->name('admin.user_management.subscribers.send_email');
  });
  // user management route end

  // vendor management route start
  Route::prefix('/vendor-management')->middleware('permission:User Management')->group(function () {
    Route::get('/settings', 'BackEnd\VendorManagementController@settings')->name('admin.vendor_management.settings');
    Route::post('/settings/update', 'BackEnd\VendorManagementController@update_setting')->name('admin.vendor_management.setting.update');

    Route::get('/add-vendor', 'BackEnd\VendorManagementController@add')->name('admin.vendor_management.add_vendor');
    Route::post('/save-vendor', 'BackEnd\VendorManagementController@create')->name('admin.vendor_management.save-vendor');

    Route::get('/registered-vendors', 'BackEnd\VendorManagementController@index')->name('admin.vendor_management.registered_vendor');

    Route::prefix('/vendor/{id}')->group(function () {

      Route::post(
        '/update-account-status',
        'BackEnd\VendorManagementController@updateAccountStatus'
      )->name('admin.vendor_management.vendor.update_account_status');

      Route::post(
        '/update-email-status',
        'BackEnd\VendorManagementController@updateEmailStatus'
      )->name('admin.vendor_management.vendor.update_email_status');

      Route::get('/details', 'BackEnd\VendorManagementController@show')->name('admin.vendor_management.vendor_details');

      Route::get('/edit', 'BackEnd\VendorManagementController@edit')->name('admin.edit_management.vendor_edit');

      Route::post('/update', 'BackEnd\VendorManagementController@update')->name('admin.vendor_management.vendor.update_vendor');

      Route::post(
        '/update/vendor/balance',
        'BackEnd\VendorManagementController@update_vendor_balance'
      )->name('admin.vendor_management.update_vendor_balance');

      Route::get('/change-password', 'BackEnd\VendorManagementController@changePassword')->name('admin.vendor_management.vendor.change_password');

      Route::post('/update-password', 'BackEnd\VendorManagementController@updatePassword')->name('admin.vendor_management.vendor.update_password');

      Route::post('/delete', 'BackEnd\VendorManagementController@destroy')->name('admin.vendor_management.vendor.delete');
    });

    Route::post('/vendor/current-package/remove', 'BackEnd\VendorManagementController@removeCurrPackage')->name('vendor.currPackage.remove');

    Route::post('/vendor/current-package/change', 'BackEnd\VendorManagementController@changeCurrPackage')->name('vendor.currPackage.change');

    Route::post('/vendor/current-package/add', 'BackEnd\VendorManagementController@addCurrPackage')->name('vendor.currPackage.add');

    Route::post('/vendor/next-package/remove', 'BackEnd\VendorManagementController@removeNextPackage')->name('vendor.nextPackage.remove');

    Route::post('/vendor/next-package/change', 'BackEnd\VendorManagementController@changeNextPackage')->name('vendor.nextPackage.change');

    Route::post('/vendor/next-package/add', 'BackEnd\VendorManagementController@addNextPackage')->name('vendor.nextPackage.add');

    Route::post('/bulk-delete-vendor', 'BackEnd\VendorManagementController@bulkDestroy')->name('admin.vendor_management.bulk_delete_vendor');

    Route::get('/secret-login/{id}', 'BackEnd\VendorManagementController@secret_login')->name('admin.vendor_management.vendor.secret_login');
  });
  // vendor management route start

  // home-page route start
  Route::prefix('/home-page')->middleware('permission:Home Page')->group(function () {
    // hero section
    Route::prefix('/hero-section')->group(function () {
      // slider version route
      Route::prefix('/slider-version')->group(function () {
        Route::get('', 'BackEnd\HomePage\Hero\SliderController@index')->name('admin.home_page.hero_section.slider_version');

        Route::post('/store', 'BackEnd\HomePage\Hero\SliderController@store')->name('admin.home_page.hero_section.slider_version.store');

        Route::post('/update', 'BackEnd\HomePage\Hero\SliderController@update')->name('admin.home_page.hero_section.slider_version.update');

        Route::post('/{id}/delete', 'BackEnd\HomePage\Hero\SliderController@destroy')->name('admin.home_page.hero_section.slider_version.delete');

        Route::post('update-video-url', 'BackEnd\HomePage\Hero\SliderController@update_video_url')->name('admin.home_page.hero_section.update.video-url');
      });

      // static version route
      Route::prefix('/static-version')->group(function () {
        Route::get('', 'BackEnd\HomePage\Hero\StaticController@index')->name('admin.home_page.hero_section.static_version');

        Route::post('/update-image', 'BackEnd\HomePage\Hero\StaticController@updateImage')->name('admin.home_page.hero_section.static_version.update_image');

        Route::post(
          '/update-information',
          'BackEnd\HomePage\Hero\StaticController@updateInformation'
        )->name('admin.home_page.hero_section.static_version.update_information');
      });
    });

    // category section
    Route::get('/category-section', 'BackEnd\HomePage\CategorySectionController@index')->name('admin.home_page.category_section');


    Route::post('/update-category-section', 'BackEnd\HomePage\CategorySectionController@update')->name('admin.home_page.update_category_section');


    // work process section
    Route::get('/work-process-section', 'BackEnd\HomePage\WorkProcessController@sectionInfo')->name('admin.home_page.work_process_section');

    Route::post('/update-work-process-section', 'BackEnd\HomePage\WorkProcessController@updateSectionInfo')->name('admin.home_page.update_work_process_section');

    Route::prefix('/work-process')->group(function () {
      Route::post('/store', 'BackEnd\HomePage\WorkProcessController@storeWorkProcess')->name('admin.home_page.store_work_process');

      Route::post('/update', 'BackEnd\HomePage\WorkProcessController@updateWorkProcess')->name('admin.home_page.update_work_process');

      Route::post('{id}/delete', 'BackEnd\HomePage\WorkProcessController@destroyWorkProcess')->name('admin.home_page.delete_work_process');

      Route::post('/bulk-delete', 'BackEnd\HomePage\WorkProcessController@bulkDestroyWorkProcess')->name('admin.home_page.bulk_delete_work_process');
    });

    // features property section
    Route::get('/feature-section', 'BackEnd\HomePage\FeatureController@sectionInfo')->name('admin.home_page.feature_section');

    Route::post('/update-feature-section', 'BackEnd\HomePage\FeatureController@updateSectionInfo')->name('admin.home_page.update_feature_section');

    // proeprty section
    Route::get('/property-section', 'BackEnd\HomePage\PropertySectionController@sectionInfo')->name('admin.home_page.property_section');

    Route::post('/update-property-section', 'BackEnd\HomePage\PropertySectionController@updateSectionInfo')->name('admin.home_page.update_property_section');

    // city section
    Route::get('/city-section', 'BackEnd\HomePage\CitySectionController@sectionInfo')->name('admin.home_page.city_section');
    Route::post('/update-city-section', 'BackEnd\HomePage\CitySectionController@updateSectionInfo')->name('admin.home_page.update_city_section');

    // Vendor section
    Route::get('/vendor-section', 'BackEnd\HomePage\VendorSectionController@sectionInfo')->name('admin.home_page.vendor_section');
    Route::post('/update-vendor-section', 'BackEnd\HomePage\VendorSectionController@updateSectionInfo')->name('admin.home_page.update_vendor_section');

    // Project section
    Route::get('/project-section', 'BackEnd\HomePage\ProjectSectionController@sectionInfo')->name('admin.home_page.project_section');
    Route::post('/update-project-section', 'BackEnd\HomePage\ProjectSectionController@updateSectionInfo')->name('admin.home_page.update_project_section');

    // Pricing section
    Route::get('/pricing-section', 'BackEnd\HomePage\PricingSectionController@sectionInfo')->name('admin.home_page.pricing_section');
    Route::post('/update-pricing-section', 'BackEnd\HomePage\PricingSectionController@updateSectionInfo')->name('admin.home_page.update_pricing_section');

    // Project section
    Route::get('/project-section', 'BackEnd\HomePage\ProjectSectionController@sectionInfo')->name('admin.home_page.project_section');
    Route::post('/update-project-section', 'BackEnd\HomePage\ProjectSectionController@updateSectionInfo')->name('admin.home_page.update_project_section');

    Route::prefix('/feature')->group(function () {
      Route::post('/store', 'BackEnd\HomePage\FeatureController@storeFeature')->name('admin.home_page.store_feature');

      Route::post('/update', 'BackEnd\HomePage\FeatureController@updateFeature')->name('admin.home_page.update_feature');

      Route::post('{id}/delete', 'BackEnd\HomePage\FeatureController@destroyFeature')->name('admin.home_page.delete_feature');

      Route::post('/bulk-delete', 'BackEnd\HomePage\FeatureController@bulkDestroyFeature')->name('admin.home_page.bulk_delete_feature');
    });

    // counter section
    Route::get('/counter-section', 'BackEnd\HomePage\CounterController@index')->name('admin.home_page.counter_section');

    Route::post('/update-counter-section-image', 'BackEnd\HomePage\CounterController@updateImage')->name('admin.home_page.update_counter_section_image');

    Route::post('/update-counter-section-info', 'BackEnd\HomePage\CounterController@updateInfo')->name('admin.home_page.update_counter_section_info');

    Route::prefix('/counter')->group(function () {
      Route::post('/store', 'BackEnd\HomePage\CounterController@storeCounter')->name('admin.home_page.store_counter');

      Route::post('/update', 'BackEnd\HomePage\CounterController@updateCounter')->name('admin.home_page.update_counter');

      Route::post('{id}/delete', 'BackEnd\HomePage\CounterController@destroyCounter')->name('admin.home_page.delete_counter');

      Route::post('/bulk-delete', 'BackEnd\HomePage\CounterController@bulkDestroyCounter')->name('admin.home_page.bulk_delete_counter');
    });

    // testimonial section
    Route::get('/testimonial-section', 'BackEnd\HomePage\TestimonialController@index')->name('admin.home_page.testimonial_section');

    Route::post('/update-testimonial-section', 'BackEnd\HomePage\TestimonialController@updateSectionInfo')->name('admin.home_page.update_testimonial_section');

    Route::post('/update-testimonial-section-img', 'BackEnd\HomePage\TestimonialController@updateSectionBackground')->name('admin.home_page.update_testimonial_section_background');

    Route::prefix('/testimonial')->group(function () {
      Route::post('/store', 'BackEnd\HomePage\TestimonialController@storeTestimonial')->name('admin.home_page.store_testimonial');

      Route::post('/update', 'BackEnd\HomePage\TestimonialController@updateTestimonial')->name('admin.home_page.update_testimonial');

      Route::post('{id}/delete', 'BackEnd\HomePage\TestimonialController@destroyTestimonial')->name('admin.home_page.delete_testimonial');

      Route::post('/bulk-delete', 'BackEnd\HomePage\TestimonialController@bulkDestroyTestimonial')->name('admin.home_page.bulk_delete_testimonial');
    });

    // subscribe section
    Route::get('/subscribe-section', 'BackEnd\HomePage\SubscribeController@index')->name('admin.home_page.subscribe_section');
    Route::post('/update-subscribe-section', 'BackEnd\HomePage\SubscribeController@updateSectionInfo')->name('admin.home_page.update_subscribe_section');
    Route::post('/update-subscribe-section-img', 'BackEnd\HomePage\SubscribeController@updateSectionBackground')->name('admin.home_page.update_subscribe_section_background');

    // call to action section
    Route::get('/call-to-action-section', 'BackEnd\HomePage\CallToActionController@index')->name('admin.home_page.call_to_action_section');

    Route::post('/update-call-to-action-section-image', 'BackEnd\HomePage\CallToActionController@updateImage')->name('admin.home_page.update_call_to_action_section_image');

    Route::post('/update-call-to-action-section', 'BackEnd\HomePage\CallToActionController@update')->name('admin.home_page.update_call_to_action_section');

    // blog section
    Route::get('/blog-section', 'BackEnd\HomePage\BlogController@index')->name('admin.home_page.blog_section');

    Route::post('/update-blog-section', 'BackEnd\HomePage\BlogController@update')->name('admin.home_page.update_blog_section');

    // section customization
    Route::get('/section-customization', 'BackEnd\HomePage\SectionController@index')->name('admin.home_page.section_customization');

    Route::post(
      '/update-section-status',
      'BackEnd\HomePage\SectionController@update'
    )->name('admin.home_page.update_section_status');



    // about section
    Route::prefix('/about-section')->group(function () {
      Route::get('', 'BackEnd\HomePage\AboutController@index')->name('admin.home_page.about_section');

      Route::post('/update-image', 'BackEnd\HomePage\AboutController@updateImage')->name('admin.home_page.update_about_img');

      Route::post('/update-info', 'BackEnd\HomePage\AboutController@updateInfo')->name('admin.home_page.update_about_info');
    });

    // about section
    Route::prefix('/why-choose-us-section')->group(function () {
      Route::get('', 'BackEnd\HomePage\WhyChooseUsController@index')->name('admin.home_page.why_choose_us_section');

      Route::post('/update-image', 'BackEnd\HomePage\WhyChooseUsController@updateImage')->name('admin.home_page.update_why_choose_us_img');

      Route::post('/update-info', 'BackEnd\HomePage\WhyChooseUsController@updateInfo')->name('admin.home_page.update_why_choose_us_info');
    });

    // brand section
    Route::prefix('/brand-section')->group(function () {
      Route::get('', 'BackEnd\HomePage\BrandController@index')->name('admin.home_page.brand_section');

      Route::post('/store', 'BackEnd\HomePage\BrandController@store')->name('admin.home_page.brand_section.store');

      Route::post('/update', 'BackEnd\HomePage\BrandController@update')->name('admin.home_page.brand_section.update');

      Route::post('/{id}/delete', 'BackEnd\HomePage\BrandController@destroy')->name('admin.home_page.brand_section.delete');
    });
  });

  // home-page route end


  #====support tickets ============

  Route::prefix('support-ticket')->group(function () {
    Route::get('/setting', 'BackEnd\SupportTicketController@setting')->name('admin.support_ticket.setting');
    Route::post('/setting/update', 'BackEnd\SupportTicketController@update_setting')->name('admin.support_ticket.update_setting');
    Route::get('/tickets', 'BackEnd\SupportTicketController@index')->name('admin.support_tickets');
    Route::get('/message/{id}', 'BackEnd\SupportTicketController@message')->name('admin.support_tickets.message');
    Route::post('/zip-upload', 'BackEnd\SupportTicketController@zip_file_upload')->name('admin.support_ticket.zip_file.upload');
    Route::post('/reply/{id}', 'BackEnd\SupportTicketController@ticketreply')->name('admin.support_ticket.reply');
    Route::post('/closed/{id}', 'BackEnd\SupportTicketController@ticket_closed')->name('admin.support_ticket.close');
    Route::post('/assign-stuff/{id}', 'BackEnd\SupportTicketController@assign_stuff')->name('assign_stuff.supoort.ticket');

    Route::get('/unassign-stuff/{id}', 'BackEnd\SupportTicketController@unassign_stuff')->name('admin.support_tickets.unassign');

    Route::post('/delete/{id}', 'BackEnd\SupportTicketController@delete')->name('admin.support_tickets.delete');
    Route::post('/bulk-delete', 'BackEnd\SupportTicketController@bulk_delete')->name('admin.support_tickets.bulk_delete');
  });


  // footer route start
  Route::prefix('/footer')->middleware('permission:Footer')->group(function () {
    // logo & image route
    Route::get('/logo-and-image', 'BackEnd\Footer\ImageController@index')->name('admin.footer.logo_and_image');

    Route::post('/update-logo', 'BackEnd\Footer\ImageController@updateLogo')->name('admin.footer.update_logo');

    Route::post(
      '/update-background-image',
      'BackEnd\Footer\ImageController@updateImage'
    )->name('admin.footer.update_background_image');

    // content route
    Route::get('/content', 'BackEnd\Footer\ContentController@index')->name('admin.footer.content');

    Route::post('/update-content', 'BackEnd\Footer\ContentController@update')->name('admin.footer.update_content');

    // quick link route
    Route::get('/quick-links', 'BackEnd\Footer\QuickLinkController@index')->name('admin.footer.quick_links');

    Route::post('/store-quick-link', 'BackEnd\Footer\QuickLinkController@store')->name('admin.footer.store_quick_link');

    Route::post('/update-quick-link', 'BackEnd\Footer\QuickLinkController@update')->name('admin.footer.update_quick_link');

    Route::post(
      '/delete-quick-link/{id}',
      'BackEnd\Footer\QuickLinkController@destroy'
    )->name('admin.footer.delete_quick_link');
  });
  // footer route end


  // custom-pages route start
  Route::prefix('/custom-pages')->middleware('permission:Custom Pages')->group(function () {
    Route::get('', 'BackEnd\CustomPageController@index')->name('admin.custom_pages');

    Route::get('/create-page', 'BackEnd\CustomPageController@create')->name('admin.custom_pages.create_page');

    Route::post('/store-page', 'BackEnd\CustomPageController@store')->name('admin.custom_pages.store_page');

    Route::get('/edit-page/{id}', 'BackEnd\CustomPageController@edit')->name('admin.custom_pages.edit_page');

    Route::post('/update-page/{id}', 'BackEnd\CustomPageController@update')->name('admin.custom_pages.update_page');

    Route::post('/delete-page/{id}', 'BackEnd\CustomPageController@destroy')->name('admin.custom_pages.delete_page');

    Route::post('/bulk-delete-page', 'BackEnd\CustomPageController@bulkDestroy')->name('admin.custom_pages.bulk_delete_page');
  });
  // custom-pages route end

  // blog route start
  Route::prefix('/blog-management')->middleware('permission:Blog Management')->group(function () {
    // blog category route
    Route::get('/categories', 'BackEnd\Journal\CategoryController@index')->name('admin.blog_management.categories');

    Route::post('/store-category', 'BackEnd\Journal\CategoryController@store')->name('admin.blog_management.store_category');

    Route::post('/update-category', 'BackEnd\Journal\CategoryController@update')->name('admin.blog_management.update_category');

    Route::post(
      '/delete-category/{id}',
      'BackEnd\Journal\CategoryController@destroy'
    )->name('admin.blog_management.delete_category');

    Route::post(
      '/bulk-delete-category',
      'BackEnd\Journal\CategoryController@bulkDestroy'
    )->name('admin.blog_management.bulk_delete_category');

    // blog route
    Route::get(
      '/blogs',
      'BackEnd\Journal\BlogController@index'
    )->name('admin.blog_management.blogs');

    Route::get('/create-blog', 'BackEnd\Journal\BlogController@create')->name('admin.blog_management.create_blog');

    Route::post('/store-blog', 'BackEnd\Journal\BlogController@store')->name('admin.blog_management.store_blog');

    Route::get('/edit-blog/{id}', 'BackEnd\Journal\BlogController@edit')->name('admin.blog_management.edit_blog');

    Route::post('/update-blog/{id}', 'BackEnd\Journal\BlogController@update')->name('admin.blog_management.update_blog');

    Route::post('/delete-blog/{id}', 'BackEnd\Journal\BlogController@destroy')->name('admin.blog_management.delete_blog');

    Route::post('/bulk-delete-blog', 'BackEnd\Journal\BlogController@bulkDestroy')->name('admin.blog_management.bulk_delete_blog');
  });
  // blog route end

  // faq route start
  Route::prefix('/faq-management')->middleware('permission:FAQ Management')->group(function () {
    Route::get('', 'BackEnd\FaqController@index')->name('admin.faq_management');

    Route::post('/store-faq', 'BackEnd\FaqController@store')->name('admin.faq_management.store_faq');

    Route::post('/update-faq', 'BackEnd\FaqController@update')->name('admin.faq_management.update_faq');

    Route::post('/delete-faq/{id}', 'BackEnd\FaqController@destroy')->name('admin.faq_management.delete_faq');

    Route::post('/bulk-delete-faq', 'BackEnd\FaqController@bulkDestroy')->name('admin.faq_management.bulk_delete_faq');
  });
  // faq route end

  // advertise route start
  Route::prefix('/advertise')->middleware('permission:Advertise')->group(function () {
    Route::get('/settings', 'BackEnd\AdvertisementController@advertiseSettings')->name('admin.advertise.settings');

    Route::post('/update-settings', 'BackEnd\AdvertisementController@updateAdvertiseSettings')->name('admin.advertise.update_settings');

    Route::get('/all-advertisement', 'BackEnd\AdvertisementController@index')->name('admin.advertise.all_advertisement');

    Route::post('/store-advertisement', 'BackEnd\AdvertisementController@store')->name('admin.advertise.store_advertisement');

    Route::post(
      '/update-advertisement',
      'BackEnd\AdvertisementController@update'
    )->name('admin.advertise.update_advertisement');

    Route::post('/delete-advertisement/{id}', 'BackEnd\AdvertisementController@destroy')->name('admin.advertise.delete_advertisement');

    Route::post('/bulk-delete-advertisement', 'BackEnd\AdvertisementController@bulkDestroy')->name('admin.advertise.bulk_delete_advertisement');
  });
  // advertise route end

  // announcement-popup route start
  Route::prefix('/announcement-popups')->middleware('permission:Announcement Popups')->group(function () {
    Route::get('', 'BackEnd\PopupController@index')->name('admin.announcement_popups');

    Route::get('/select-popup-type', 'BackEnd\PopupController@popupType')->name('admin.announcement_popups.select_popup_type');

    Route::get('/create-popup/{type}', 'BackEnd\PopupController@create')->name('admin.announcement_popups.create_popup');

    Route::post('/store-popup', 'BackEnd\PopupController@store')->name('admin.announcement_popups.store_popup');

    Route::post('/popup/{id}/update-status', 'BackEnd\PopupController@updateStatus')->name('admin.announcement_popups.update_popup_status');

    Route::get('/edit-popup/{id}', 'BackEnd\PopupController@edit')->name('admin.announcement_popups.edit_popup');

    Route::post('/update-popup/{id}', 'BackEnd\PopupController@update')->name('admin.announcement_popups.update_popup');

    Route::post('/delete-popup/{id}', 'BackEnd\PopupController@destroy')->name('admin.announcement_popups.delete_popup');

    Route::post('/bulk-delete-popup', 'BackEnd\PopupController@bulkDestroy')->name('admin.announcement_popups.bulk_delete_popup');
  });
  // announcement-popup route end

  // payment-gateway route start
  Route::prefix('/payment-gateways')->middleware('permission:Payment Gateways')->group(function () {
    Route::get('/online-gateways', 'BackEnd\PaymentGateway\OnlineGatewayController@index')->name('admin.payment_gateways.online_gateways');
    Route::post('/update-paypal-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePayPalInfo')->name('admin.payment_gateways.update_paypal_info');
    Route::post('/update-instamojo-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateInstamojoInfo')->name('admin.payment_gateways.update_instamojo_info');
    Route::post('/update-paystack-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePaystackInfo')->name('admin.payment_gateways.update_paystack_info');
    Route::post('/update-flutterwave-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateFlutterwaveInfo')->name('admin.payment_gateways.update_flutterwave_info');
    Route::post('/update-razorpay-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateRazorpayInfo')->name('admin.payment_gateways.update_razorpay_info');
    Route::post('/update-mercadopago-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateMercadoPagoInfo')->name('admin.payment_gateways.update_mercadopago_info');
    Route::post('/update-mollie-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateMollieInfo')->name('admin.payment_gateways.update_mollie_info');
    Route::post('/update-stripe-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateStripeInfo')->name('admin.payment_gateways.update_stripe_info');
    Route::post('/update-paytm-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePaytmInfo')->name('admin.payment_gateways.update_paytm_info');
    Route::post('/update-anet-info', 'BackEnd\PaymentGateway\OnlineGatewayController@updateAnetInfo')->name('admin.payment_gateways.update_anet_info');
                // for shohag-2.0
    Route::post('/midtrans', 'BackEnd\PaymentGateway\OnlineGatewayController@updateMidtransInfo')->name('admin.payment_gateways.update_midtrans_info');
    Route::post('/iyzico', 'BackEnd\PaymentGateway\OnlineGatewayController@updateIyzicoInfo')->name('admin.payment_gateways.update_iyzico_info');
    Route::post('/paytabs', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePaytabsInfo')->name('admin.payment_gateways.update_paytabs_info');
    Route::post('/toyyibpay', 'BackEnd\PaymentGateway\OnlineGatewayController@updateToyyibpayInfo')->name('admin.payment_gateways.update_toyyibpay_info');
    Route::post('/phonepe', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePhonepeInfo')->name('admin.payment_gateways.update_phonepe_info');
    Route::post('/yoco', 'BackEnd\PaymentGateway\OnlineGatewayController@updateYocoInfo')->name('admin.payment_gateways.update_yoco_info');
    Route::post('/myfatoorah', 'BackEnd\PaymentGateway\OnlineGatewayController@updateMyFatoorahInfo')->name('admin.payment_gateways.update_myfatoorah_info');
    Route::post('/xendit', 'BackEnd\PaymentGateway\OnlineGatewayController@updateXenditInfo')->name('admin.payment_gateways.update_xendit_info');
    Route::post('/perfect-money', 'BackEnd\PaymentGateway\OnlineGatewayController@updatePerfectMoneyInfo')->name('admin.payment_gateways.update_perfect_money_info');
    Route::post('/nowpayment', 'BackEnd\PaymentGateway\OnlineGatewayController@updatNowPayment')->name('admin.payment_gateways.update_nowpayment_info');

    Route::get('/offline-gateways', 'BackEnd\PaymentGateway\OfflineGatewayController@index')->name('admin.payment_gateways.offline_gateways');
    Route::post('/store-offline-gateway', 'BackEnd\PaymentGateway\OfflineGatewayController@store')->name('admin.payment_gateways.store_offline_gateway');
    Route::post('/update-status/{id}', 'BackEnd\PaymentGateway\OfflineGatewayController@updateStatus')->name('admin.payment_gateways.update_status');
    Route::post('/update-offline-gateway', 'BackEnd\PaymentGateway\OfflineGatewayController@update')->name('admin.payment_gateways.update_offline_gateway');
    Route::post('/delete-offline-gateway/{id}', 'BackEnd\PaymentGateway\OfflineGatewayController@destroy')->name('admin.payment_gateways.delete_offline_gateway');
  });
  // payment-gateway route end

  Route::prefix('/basic-settings')->middleware('permission:Basic Settings')->group(function () {
    // basic settings favicon route

    Route::get('/favicon', 'BackEnd\BasicSettings\BasicController@favicon')->name('admin.basic_settings.favicon');

    Route::post('/update-favicon', 'BackEnd\BasicSettings\BasicController@updateFavicon')->name('admin.basic_settings.update_favicon');

    // basic settings logo route
    Route::get('/logo', 'BackEnd\BasicSettings\BasicController@logo')->name('admin.basic_settings.logo');

    Route::post('/update-logo', 'BackEnd\BasicSettings\BasicController@updateLogo')->name('admin.basic_settings.update_logo');

    // basic settings information route
    Route::get('/information', 'BackEnd\BasicSettings\BasicController@information')->name('admin.basic_settings.information');

    Route::post('/update-info', 'BackEnd\BasicSettings\BasicController@updateInfo')->name('admin.basic_settings.update_info');

    Route::get('/general-settings', 'BackEnd\BasicSettings\BasicController@general_settings')->name('admin.basic_settings.general_settings');

    Route::post('/update-general-settings', 'BackEnd\BasicSettings\BasicController@update_general_setting')->name('admin.basic_settings.general_settings.update');

    Route::get('/contact-page', 'BackEnd\BasicSettings\BasicController@contact_page')->name('admin.basic_settings.contact_page');

    Route::post('/update-contact-page', 'BackEnd\BasicSettings\BasicController@update_contact_page')->name('admin.basic_settings.contact_page.update');

    // basic settings (theme & home) route
    Route::get('/theme-and-home', 'BackEnd\BasicSettings\BasicController@themeAndHome')->name('admin.basic_settings.theme_and_home');

    Route::post(
      '/update-theme-and-home',
      'BackEnd\BasicSettings\BasicController@updateThemeAndHome'
    )->name('admin.basic_settings.update_theme_and_home');

    // basic settings currency route
    Route::get('/currency', 'BackEnd\BasicSettings\BasicController@currency')->name('admin.basic_settings.currency');

    Route::post('/update-currency', 'BackEnd\BasicSettings\BasicController@updateCurrency')->name('admin.basic_settings.update_currency');

    // basic settings appearance route
    Route::get('/appearance', 'BackEnd\BasicSettings\BasicController@appearance')->name('admin.basic_settings.appearance');

    Route::post('/update-appearance', 'BackEnd\BasicSettings\BasicController@updateAppearance')->name('admin.basic_settings.update_appearance');

    // basic settings mail route start
    Route::get('/mail-from-admin', 'BackEnd\BasicSettings\BasicController@mailFromAdmin')->name('admin.basic_settings.mail_from_admin');

    Route::post(
      '/update-mail-from-admin',
      'BackEnd\BasicSettings\BasicController@updateMailFromAdmin'
    )->name('admin.basic_settings.update_mail_from_admin');

    Route::get('/mail-to-admin', 'BackEnd\BasicSettings\BasicController@mailToAdmin')->name('admin.basic_settings.mail_to_admin');

    Route::post(
      '/update-mail-to-admin',
      'BackEnd\BasicSettings\BasicController@updateMailToAdmin'
    )->name('admin.basic_settings.update_mail_to_admin');

    Route::get('/mail-templates', 'BackEnd\BasicSettings\MailTemplateController@index')->name('admin.basic_settings.mail_templates');

    Route::get('/edit-mail-template/{id}', 'BackEnd\BasicSettings\MailTemplateController@edit')->name('admin.basic_settings.edit_mail_template');

    Route::post('/update-mail-template/{id}', 'BackEnd\BasicSettings\MailTemplateController@update')->name('admin.basic_settings.update_mail_template');
    // basic settings mail route end

    // basic settings breadcrumb route
    Route::get('/breadcrumb', 'BackEnd\BasicSettings\BasicController@breadcrumb')->name('admin.basic_settings.breadcrumb');

    Route::post('/update-breadcrumb', 'BackEnd\BasicSettings\BasicController@updateBreadcrumb')->name('admin.basic_settings.update_breadcrumb');

    // basic settings page-headings route
    Route::get('/page-headings', 'BackEnd\BasicSettings\PageHeadingController@pageHeadings')->name('admin.basic_settings.page_headings');

    Route::post(
      '/update-page-headings',
      'BackEnd\BasicSettings\PageHeadingController@updatePageHeadings'
    )->name('admin.basic_settings.update_page_headings');

    // basic settings plugins route start
    Route::get('/plugins', 'BackEnd\BasicSettings\BasicController@plugins')->name('admin.basic_settings.plugins');

    Route::post('/update-disqus', 'BackEnd\BasicSettings\BasicController@updateDisqus')->name('admin.basic_settings.update_disqus');

    Route::post('/update-tawkto', 'BackEnd\BasicSettings\BasicController@updateTawkTo')->name('admin.basic_settings.update_tawkto');

    Route::post('/update-recaptcha', 'BackEnd\BasicSettings\BasicController@updateRecaptcha')->name('admin.basic_settings.update_recaptcha');

    Route::post('/update-facebook', 'BackEnd\BasicSettings\BasicController@updateFacebook')->name('admin.basic_settings.update_facebook');

    Route::post('/update-google', 'BackEnd\BasicSettings\BasicController@updateGoogle')->name('admin.basic_settings.update_google');

    Route::post('/update-whatsapp', 'BackEnd\BasicSettings\BasicController@updateWhatsApp')->name('admin.basic_settings.update_whatsapp');
    // basic settings plugins route end

    // basic settings seo route
    Route::get('/seo', 'BackEnd\BasicSettings\SEOController@index')->name('admin.basic_settings.seo');

    Route::post('/update-seo', 'BackEnd\BasicSettings\SEOController@update')->name('admin.basic_settings.update_seo');

    // basic settings maintenance-mode route
    Route::get('/maintenance-mode', 'BackEnd\BasicSettings\BasicController@maintenance')->name('admin.basic_settings.maintenance_mode');

    Route::post('/update-maintenance-mode', 'BackEnd\BasicSettings\BasicController@updateMaintenance')->name('admin.basic_settings.update_maintenance_mode');

    // basic settings cookie-alert route
    Route::get('/cookie-alert', 'BackEnd\BasicSettings\CookieAlertController@cookieAlert')->name('admin.basic_settings.cookie_alert');

    Route::post('/update-cookie-alert', 'BackEnd\BasicSettings\CookieAlertController@updateCookieAlert')->name('admin.basic_settings.update_cookie_alert');

    // basic-settings social-media route
    Route::get('/social-medias', 'BackEnd\BasicSettings\SocialMediaController@index')->name('admin.basic_settings.social_medias');

    Route::post('/store-social-media', 'BackEnd\BasicSettings\SocialMediaController@store')->name('admin.basic_settings.store_social_media');

    Route::post('/update-social-media', 'BackEnd\BasicSettings\SocialMediaController@update')->name('admin.basic_settings.update_social_media');

    Route::post('/delete-social-media/{id}', 'BackEnd\BasicSettings\SocialMediaController@destroy')->name('admin.basic_settings.delete_social_media');
  });



  // admin management route start
  Route::prefix('/admin-management')->middleware('permission:Admin Management')->group(function () {
    // role-permission route
    Route::get('/role-permissions', 'BackEnd\Administrator\RolePermissionController@index')->name('admin.admin_management.role_permissions');

    Route::post('/store-role', 'BackEnd\Administrator\RolePermissionController@store')->name('admin.admin_management.store_role');

    Route::get('/role/{id}/permissions', 'BackEnd\Administrator\RolePermissionController@permissions')->name('admin.admin_management.role.permissions');

    Route::post('/role/{id}/update-permissions', 'BackEnd\Administrator\RolePermissionController@updatePermissions')->name('admin.admin_management.role.update_permissions');

    Route::post('/update-role', 'BackEnd\Administrator\RolePermissionController@update')->name('admin.admin_management.update_role');

    Route::post('/delete-role/{id}', 'BackEnd\Administrator\RolePermissionController@destroy')->name('admin.admin_management.delete_role');

    // registered admin route
    Route::get('/registered-admins', 'BackEnd\Administrator\SiteAdminController@index')->name('admin.admin_management.registered_admins');

    Route::post('/store-admin', 'BackEnd\Administrator\SiteAdminController@store')->name('admin.admin_management.store_admin');

    Route::post('/update-status/{id}', 'BackEnd\Administrator\SiteAdminController@updateStatus')->name('admin.admin_management.update_status');

    Route::post('/update-admin', 'BackEnd\Administrator\SiteAdminController@update')->name('admin.admin_management.update_admin');

    Route::post('/delete-admin/{id}', 'BackEnd\Administrator\SiteAdminController@destroy')->name('admin.admin_management.delete_admin');
  });
  // admin management route end


  // language management route start
  Route::prefix('/language-management')->middleware('permission:Language Management')->group(function () {
    Route::get('', 'BackEnd\LanguageController@index')->name('admin.language_management');

    Route::post('/store', 'BackEnd\LanguageController@store')->name('admin.language_management.store');

    Route::post('/{id}/make-default-language', 'BackEnd\LanguageController@makeDefault')->name('admin.language_management.make_default_language');

    Route::post('/update', 'BackEnd\LanguageController@update')->name('admin.language_management.update');

    Route::get('/{id}/edit-keyword', 'BackEnd\LanguageController@editKeyword')->name('admin.language_management.edit_keyword');

    Route::post('add-keyword', 'BackEnd\LanguageController@addKeyword')->name('admin.language_management.add_keyword');

    Route::post('/{id}/update-keyword', 'BackEnd\LanguageController@updateKeyword')->name('admin.language_management.update_keyword');

    Route::post('/{id}/delete', 'BackEnd\LanguageController@destroy')->name('admin.language_management.delete');

    Route::get('/{id}/check-rtl', 'BackEnd\LanguageController@checkRTL');
    Route::get('/{id}/check-rtl2', 'BackEnd\LanguageController@checkRTL2');
  });
  // language management route end
});
