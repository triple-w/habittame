<?php

namespace App\Http\Controllers\BackEnd\Property;

use App\Http\Controllers\Controller;
use App\Models\Property\PropertyContact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Session;

class PropertyMessageController extends Controller
{
    public function index()
    {
        $messages = PropertyContact::with('property')->where('vendor_id', 0)->latest()->get();
        return view('backend.property.message', compact('messages'));
    }
    public function destroy(Request $request)
    {
        $message = PropertyContact::where('vendor_id', 0)->find($request->message_id);
        if ($message) {

            $message->delete();
        } else {
            Session::flash('warning', 'Something went wrong!');
            return redirect()->back();
        }
        Session::flash('success', 'Message deleted successfully');
        return redirect()->back();
    }
}
