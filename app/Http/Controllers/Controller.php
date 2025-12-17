<?php

namespace App\Http\Controllers;

use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use Config;
use Exception;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Mail\Message;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Session;
use Mail;
use PDF;
use PHPMailer\PHPMailer\PHPMailer;

class Controller extends BaseController
{
  use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

  public function getCurrencyInfo()
  {
    $baseCurrencyInfo = Basic::select('base_currency_symbol', 'base_currency_symbol_position', 'base_currency_text', 'base_currency_text_position', 'base_currency_rate')
      ->firstOrFail();

    return $baseCurrencyInfo;
  }

  public function makeInvoice($request, $key, $member, $amount, $payment_method, $phone, $base_currency_symbol_position, $base_currency_symbol, $base_currency_text, $order_id, $package_title, $membership)
  {
    $file_name = uniqid($key) . ".pdf";
    config(['dompdf.public_path' => base_path('public')]);
    $pdf = PDF::setOptions([
      'isHtml5ParserEnabled' => true,
      'isRemoteEnabled' => true,
      'logOutputFile' => storage_path('logs/log.htm'),
      'tempDir' => storage_path('logs/')
    ])->loadView('pdf.membership', compact('request', 'member', 'amount', 'payment_method', 'phone', 'base_currency_symbol_position', 'base_currency_symbol', 'base_currency_text', 'order_id', 'package_title', 'membership'));
    $output = $pdf->output();
    @mkdir(public_path('assets/front/invoices/'), 0775, true);
    file_put_contents(public_path('assets/front/invoices/') . $file_name, $output);
    return $file_name;
  }

  public function sendMailWithPhpMailer($request, $file_name, $bs, $subject, $body, $email, $name)
  {
    //larave facade mail
    if ($bs->smtp_status == 1) {
      try {
        $smtp = [
          'transport' => 'smtp',
          'host' => $bs->smtp_host,
          'port' => $bs->smtp_port,
          'encryption' => $bs->encryption,
          'username' => $bs->smtp_username,
          'password' => $bs->smtp_password,
          'timeout' => null,
          'auth_mode' => null,
        ];
        Config::set('mail.mailers.smtp', $smtp);
      } catch (\Exception $e) {
        session()->flash('error', $e->getMessage());
        return back();
      }
    }

    $data = [
      'to' => $email,
      'subject' => $subject,
      'body' => $body,
      'file_name' => public_path('assets/front/invoices/') . $file_name,
    ];
    try {
      Mail::send([], [], function (Message $message) use ($data, $bs) {
        $fromMail = $bs->from_mail;
        $fromName = $bs->from_name;
        $message->to($data['to'])
          ->subject($data['subject'])
          ->from($fromMail, $fromName)
          ->html($data['body'], 'text/html');

        $message->attach($data['file_name'], [
          'as' => 'Attachment',
          'mime' => 'application/pdf',
        ]);
      });
      return;
    } catch (\Exception $e) {
      Session::flash('error', 'Something went wrong.');
      return back();
    }
    //larave facade mail end
  }
  public function mailToAdminForCreateProperty($propertyTitle, $vendor)
  {
    $mailer = new MegaMailer();
    $bs = Basic::first();

    $data = [
      'subject' => "New Property Listing Alert",
      'body' => "A new property listing has been posted by a vendor. Please review the details at your earliest convenience. If you have any questions or require further information please contact the vendor. <br><br>

                    <strong>Vendor Usename:</strong> $vendor->username<br>
                    <strong>Property Title:</strong> $propertyTitle<br> 
                    <br><br>
                Best Regards,<br> $bs->website_title ",
    ];

    $mailer->mailToAdmin($data);
  }

  public function mailToAdminForCreateProject($projectTitle, $vendor)
  {
    $mailer = new MegaMailer();
    $bs = Basic::first();

    $data = [
      'subject' => "New Project Listing Alert",
      'body' => "A new project listing has been posted by a vendor. Please review the details at your earliest convenience. If you have any questions or require further information please contact the vendor. <br><br>

                    <strong>Vendor Usename:</strong> $vendor->username<br>
                    <strong>Project Title:</strong> $projectTitle<br> 
                    <br><br>
                Best Regards,<br> $bs->website_title ",
    ];

    $mailer->mailToAdmin($data);
  }
}
