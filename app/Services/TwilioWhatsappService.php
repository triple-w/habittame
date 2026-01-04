<?php

namespace App\Services;

use Twilio\Rest\Client;

class TwilioWhatsappService
{
    protected $client;

    public function __construct()
    {
        $sid   = config('services.twilio.sid');
        $token = config('services.twilio.token');

        $this->client = new Client($sid, $token);
    }

    public function sendLeadToSeller($sellerPhone, $leadData)
    {
        $message = "📩 *Nuevo interesado en tu propiedad*\n\n";
        $message .= "👤 Nombre: {$leadData['name']}\n";
        $message .= "📧 Correo: {$leadData['email']}\n";
        $message .= "📞 Teléfono: {$leadData['phone']}\n\n";
        $message .= "💬 Mensaje:\n{$leadData['message']}";

        return $this->client->messages->create(
            "whatsapp:+521{$sellerPhone}",
            [
                "from" => "whatsapp:+14155238886", // Sandbox number
                "body" => $message
            ]
        );
    }
}
