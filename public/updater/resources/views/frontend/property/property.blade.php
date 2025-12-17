 @forelse ($property_contents as $property_content)
     
     <x-property :property="$property_content" class="col-lg-4 col-md-6" />
 @empty
     <div class="col-lg-12">
         <h3 class="text-center mt-5">{{ __('NO PROPERTY FOUND') . '!' }}</h3>
     </div>
 @endforelse
 <div class="row">
     <div class="col-lg-12 pagination justify-content-center customPaginagte">
         {{ $property_contents->links() }}
     </div>
 </div>
