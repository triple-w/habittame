<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Property\PropertyContact;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PropertyMessageController extends Controller
{
    public function index()
    {
        $messages = PropertyContact::with('property')->where('vendor_id', Auth::guard('vendor')->user()->id)->latest()->get();
        return view('vendors.property.message', compact('messages'));
    }

    public function destroy(Request $request)
    {
        $message = PropertyContact::where('vendor_id', Auth::guard('vendor')->user()->id)->find($request->message_id);
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
