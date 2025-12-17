<div class="col-lg-5">
    <table class="table table-striped border">
        <thead>
            <tr>
                <th scope="col">{{ __('BB Code') }}</th>
                <th scope="col">{{ __('Meaning') }}</th>
            </tr>
        </thead>
        <tbody>
            @if ($templateInfo->mail_type == 'verify_email')
                <tr>
                    <td>{username}</td>
                    <td scope="row">{{ __('Username of User') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'verify_email')
                <tr>
                    <td>{verification_link}</td>
                    <td scope="row">{{ __('Email Verification Link') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'reset_password' || $templateInfo->mail_type == 'product_order')
                <tr>
                    <td>{customer_name}</td>
                    <td scope="row">{{ __('Name of The Customer') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'balance_add' || $templateInfo->mail_type == 'balance_subtract')
                <tr>
                    <td>{amount}</td>
                    <td scope="row">{{ __('Balance add/substract  amount') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'reset_password')
                <tr>
                    <td>{password_reset_link}</td>
                    <td scope="row">{{ __('Password Reset Link') }}</td>
                </tr>
            @endif
            @if ($templateInfo->mail_type == 'registered_agent')
                <tr>
                    <td>{username}</td>
                    <td scope="row">{{ __('Agent login username') }}</td>
                </tr>
                <tr>
                    <td>{password}</td>
                    <td scope="row">{{ __('Agent login password') }}</td>
                </tr>
                <tr>
                    <td>{login_url}</td>
                    <td scope="row">{{ __('Agent login url') }}</td>
                </tr>
            @endif



            @if (
                $templateInfo->mail_type != 'verify_email' &&
                    ($templateInfo->mail_type != 'reset_password' && $templateInfo->mail_type != 'registered_agent'))
                <tr>
                    <td>{username}</td>
                    <td scope="row">{{ __('Username of Vendor') }}</td>
                </tr>
            @endif

            @if (
                $templateInfo->mail_type == 'admin_changed_current_package' ||
                    $templateInfo->mail_type == 'admin_changed_next_package' ||
                    $templateInfo->mail_type == 'admin_removed_current_package')
                <tr>
                    <td>{replaced_package}</td>
                    <td scope="row">{{ __('Replace Package Name') }}</td>
                </tr>
            @endif

            @if (
                $templateInfo->mail_type == 'admin_changed_current_package' ||
                    $templateInfo->mail_type == 'admin_added_current_package' ||
                    $templateInfo->mail_type == 'admin_changed_next_package' ||
                    $templateInfo->mail_type == 'admin_added_next_package' ||
                    $templateInfo->mail_type == 'admin_removed_current_package' ||
                    $templateInfo->mail_type == 'admin_removed_next_package' ||
                    $templateInfo->mail_type == 'package_purchase' ||
                    $templateInfo->mail_type == 'package_purchase_membership_accepted' ||
                    $templateInfo->mail_type == 'package_purchase_membership_rejected')
                <tr>
                    <td>{package_title}</td>
                    <td scope="row">{{ __('Package Name') }}</td>
                </tr>
            @endif

            @if (
                $templateInfo->mail_type == 'admin_changed_current_package' ||
                    $templateInfo->mail_type == 'admin_added_current_package' ||
                    $templateInfo->mail_type == 'admin_added_next_package' ||
                    $templateInfo->mail_type == 'package_purchase' ||
                    $templateInfo->mail_type == 'package_purchase_membership_accepted' ||
                    $templateInfo->mail_type == 'package_purchase_membership_rejected')
                <tr>
                    <td>{package_price}</td>
                    <td scope="row">{{ __('Price of Package') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'package_purchase')
                <tr>
                    <td>{discount}</td>
                    <td scope="row">{{ __('Discount Amount') }}</td>
                </tr>
            @endif
            @if ($templateInfo->mail_type == 'package_purchase')
                <tr>
                    <td>{total}</td>
                    <td scope="row">{{ __('Total Paid Amount') }}</td>
                </tr>
            @endif

            @if (
                $templateInfo->mail_type == 'admin_changed_current_package' ||
                    $templateInfo->mail_type == 'admin_added_current_package' ||
                    $templateInfo->mail_type == 'admin_changed_next_package' ||
                    $templateInfo->mail_type == 'admin_added_next_package' ||
                    $templateInfo->mail_type == 'package_purchase' ||
                    $templateInfo->mail_type == 'package_purchase_membership_accepted')
                <tr>
                    <td>{activation_date}</td>
                    <td scope="row">{{ __('Package activation date') }}</td>
                </tr>
            @endif
            @if (
                $templateInfo->mail_type == 'admin_changed_current_package' ||
                    $templateInfo->mail_type == 'admin_added_current_package' ||
                    $templateInfo->mail_type == 'admin_changed_next_package' ||
                    $templateInfo->mail_type == 'admin_added_next_package' ||
                    $templateInfo->mail_type == 'package_purchase' ||
                    $templateInfo->mail_type == 'package_purchase_membership_accepted')
                <tr>
                    <td>{expire_date}</td>
                    <td scope="row">{{ __('Package expire date') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'membership_expiry_reminder')
                <tr>
                    <td>{last_day_of_membership}</td>
                    <td scope="row">{{ __('Package expire last date') }}</td>
                </tr>
            @endif
            @if ($templateInfo->mail_type == 'membership_expiry_reminder' || $templateInfo->mail_type == 'membership_expired')
                <tr>
                    <td>{login_link}</td>
                    <td scope="row">{{ __('Login Url') }}</td>
                </tr>
            @endif

            @if ($templateInfo->mail_type == 'featured_property')
                <tr>
                    <td>{number_of_days}</td>
                    <td scope="row">{{ __('How many days the property is featured') }}</td>
                </tr>
                <tr>
                    <td>{featured_price}</td>
                    <td scope="row">{{ __('Featured Price') }}</td>
                </tr>
                <tr>
                    <td>{start_date}</td>
                    <td scope="row">{{ __('Featured Start Date') }}</td>
                </tr>
                <tr>
                    <td>{end_date}</td>
                    <td scope="row">{{ __('Featured End Date') }}</td>
                </tr>
                <tr>
                    <td>{property_link}</td>
                    <td scope="row">{{ __('Property Link') }}</td>
                </tr>
            @endif
            @if ($templateInfo->mail_type == 'property_featured_request_rejected')
                <tr>
                    <td>{property_link}</td>
                    <td scope="row">{{ __('Property Link') }}</td>
                </tr>
            @endif
            @if (
                $templateInfo->mail_type == 'payment_accepted_for_featured_property_offline_gateway' ||
                    $templateInfo->mail_type == 'payment_rejected_for_feature_property_offline_gateway')
                <tr>
                    <td>{property_link}</td>
                    <td scope="row">{{ __('Property Link') }}</td>
                </tr>
                <tr>
                    <td>{number_of_days}</td>
                    <td scope="row">{{ __('How many days the property is featured') }}</td>
                </tr>
                <tr>
                    <td>{featured_price}</td>
                    <td scope="row">{{ __(' Featured Price') }}</td>
                </tr>
                <tr>
                    <td>{payment_method}</td>
                    <td scope="row">{{ __('Payment Method') }}</td>
                </tr>
            @endif
            <tr>
                <td>{website_title}</td>
                <td scope="row">{{ __('Website Title') }}</td>
            </tr>
        </tbody>
    </table>
</div>
