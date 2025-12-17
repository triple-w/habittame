<?php

namespace App\Http\Middleware;

use App\Http\Helpers\VendorPermissionHelper;
use Auth;
use Closure;
use Illuminate\Http\Request;

class CheckVendorPackage
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::guard('vendor')->user()) {
            $currnetPackage = VendorPermissionHelper::currPackageOrPending(Auth::guard('vendor')->user()->id);
            $nextPackage = VendorPermissionHelper::nextPackage(Auth::guard('vendor')->user()->id);

            if (is_null($currnetPackage)) {
                if (is_null($nextPackage)) {
                    if ($request->expectsJson()) {
                        return response()->json([
                            'status' => 'error',
                            'deactive' => 'Your membership is expired. Please purchase a new package / extend the current package.',
                        ], 403);
                    } else {
                        session()->flash('warning', 'Your membership is expired. Please purchase a new package / extend the current package.');
                        return redirect()->route('vendor.dashboard');
                    }
                }
            }
        } elseif (Auth::guard('agent')->user()) {
            if (Auth::guard('agent')->user()->vendor_id == 0) {
                return $next($request);
            } else {
                $currnetPackage = VendorPermissionHelper::currPackageOrPending(Auth::guard('agent')->user()->vendor_id);
                $nextPackage = VendorPermissionHelper::nextPackage(Auth::guard('agent')->user()->vendor_id);
                if (is_null($currnetPackage)) {
                    if (is_null($nextPackage)) {
                        if ($request->expectsJson()) {
                            return response()->json([
                                'status' => 'error',
                                'deactive' => 'Your membership is expired. Please purchase a new package / extend the current package.',
                            ], 403);
                        } else {
                            session()->flash('warning', 'Your membership is expired. Please purchase a new package / extend the current package.');
                            return redirect()->route('agent.dashboard');
                        }
                    }
                }
            }
        }
        return $next($request);
    }
}
