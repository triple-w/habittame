<?php

namespace App\Models;

use App\Models\BasicSettings\CookieAlert;
use App\Models\BasicSettings\PageHeading;
use App\Models\BasicSettings\SEO;
use App\Models\CustomPage\PageContent;
use App\Models\FAQ;
use App\Models\Footer\FooterContent;
use App\Models\Footer\QuickLink;
use App\Models\HomePage\AboutSection;
use App\Models\HomePage\Banner;
use App\Models\HomePage\BlogSection;
use App\Models\HomePage\BrandSection;
use App\Models\HomePage\CallToActionSection;
use App\Models\HomePage\CategorySection;
use App\Models\HomePage\CitySection;
use App\Models\HomePage\CounterInformation;
use App\Models\HomePage\Hero\HeroStatic;
use App\Models\HomePage\Hero\Slider;
use App\Models\HomePage\Methodology\WorkProcess;
use App\Models\HomePage\Methodology\WorkProcessSection;
use App\Models\HomePage\PricingSection;
use App\Models\HomePage\ProjectSection;
use App\Models\HomePage\PropertySection;
use App\Models\HomePage\SubscribeSection;
use App\Models\HomePage\Testimony\Testimonial;
use App\Models\HomePage\Testimony\TestimonialSection;
use App\Models\HomePage\VendorSection;
use App\Models\HomePage\WhyChooseUs;
use App\Models\Journal\BlogCategory;
use App\Models\Journal\BlogInformation;
use App\Models\MenuBuilder;
use App\Models\Popup;
use App\Models\Project\ProjectAmenities;
use App\Models\Project\ProjectContent;
use App\Models\Project\ProjectType;
use App\Models\Project\ProjectTypeContent;
use App\Models\Project\SpacificationContent;
use App\Models\Prominence\FeatureSection;
use App\Models\Property\City;
use App\Models\Property\CityContent;
use App\Models\Property\Content;
use App\Models\Property\CountryContent;
use App\Models\Property\PropertyCategoryContent;
use App\Models\Property\SpacificationCotent;
use App\Models\Property\State;
use App\Models\Property\StateContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
  use HasFactory;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['name', 'code', 'direction', 'is_default'];



  public function propertySection()
  {
    return $this->hasOne(PropertySection::class, 'language_id', 'id');
  }
  public function subscribeSection()
  {
    return $this->hasOne(SubscribeSection::class, 'language_id', 'id');
  }

  public function projectSection()
  {
    return $this->hasOne(ProjectSection::class, 'language_id', 'id');
  }

  public function pricingSection()
  {
    return $this->hasOne(PricingSection::class, 'language_id', 'id');
  }

 
  public function citySection()
  {
    return $this->hasOne(CitySection::class, 'language_id', 'id');
  }
  public function vendorSection()
  {
    return $this->hasOne(VendorSection::class, 'language_id', 'id');
  }

  public function heroStatic()
  {
    return $this->hasOne(HeroStatic::class, 'language_id', 'id');
  }

  public function aboutSection()
  {
    return $this->hasOne(AboutSection::class, 'language_id', 'id');
  }

  public function whyChooseUsSection()
  {
    return $this->hasOne(WhyChooseUs::class, 'language_id', 'id');
  }

  public function faq()
  {
    return $this->hasMany(FAQ::class);
  }

  public function customPageInfo()
  {
    return $this->hasMany(PageContent::class);
  }

  public function footerContent()
  {
    return $this->hasOne(FooterContent::class);
  }

  public function footerQuickLink()
  {
    return $this->hasMany(QuickLink::class);
  }

  public function announcementPopup()
  {
    return $this->hasMany(Popup::class);
  }

  public function blogCategory()
  {
    return $this->hasMany(BlogCategory::class);
  }

  public function blogInformation()
  {
    return $this->hasMany(BlogInformation::class);
  }

  public function menuInfo()
  {
    return $this->hasOne(MenuBuilder::class, 'language_id', 'id');
  }


  public function workProcessSection()
  {
    return $this->hasOne(WorkProcessSection::class, 'language_id', 'id');
  }

  public function workProcess()
  {
    return $this->hasMany(WorkProcess::class, 'language_id', 'id');
  }

  public function featureSection()
  {
    return $this->hasOne(FeatureSection::class, 'language_id', 'id');
  }

  public function counterInfo()
  {
    return $this->hasMany(CounterInformation::class, 'language_id', 'id');
  }
  public function counterSection()
  {
    return $this->hasMany(CounterSection::class, 'language_id', 'id');
  }

  public function testimonialSection()
  {
    return $this->hasOne(TestimonialSection::class, 'language_id', 'id');
  }

  public function testimonial()
  {
    return $this->hasMany(Testimonial::class, 'language_id', 'id');
  }

  public function callToActionSection()
  {
    return $this->hasOne(CallToActionSection::class, 'language_id', 'id');
  }

  public function blogSection()
  {
    return $this->hasOne(BlogSection::class, 'language_id', 'id');
  }


 
  public function propertyStates()
  {
    return $this->hasMany(State::class, 'language_id', 'id');
  }
  public function propertyCities()
  {
    return $this->hasMany(City::class, 'language_id', 'id');
  }


  public function CategorySection()
  {
    return $this->hasMany(CategorySection::class);
  }

  public function vendorInfo()
  {
    return $this->hasOne(VendorInfo::class);
  }

  public function agentInfo()
  {
    return $this->hasOne(AgentInfo::class);
  }

  public function sliderInfo()
  {
    return $this->hasMany(Slider::class, 'language_id', 'id');
  }

  public function banner()
  {
    return $this->hasOne(Banner::class);
  }
  public function pageName()
  {
    return $this->hasOne(PageHeading::class);
  }

  public function seoInfo()
  {
    return $this->hasOne(SEO::class);
  }
  public function cookieAlertInfo()
  {
    return $this->hasOne(CookieAlert::class);
  }

  public function projectAmenities()
  {
    return $this->hasMany(ProjectAmenities::class);
  }

  public function projectType()
  {
    return $this->hasOne(ProjectType::class, 'language_id', 'id');
  }

  public function amenityContents()
  {
    return $this->hasMany(AmenityContent::class, 'language_id', 'id');
  }

  
  public function propertyCategoryContents(){
    return $this->hasMany(PropertyCategoryContent::class,'language_id','id');
  }

  public function propertyCountryContents()
  {
    return $this->hasMany(CountryContent::class, 'language_id', 'id');
  }

  public function propertyStateContents()
  {
    return $this->hasMany(StateContent::class, 'language_id', 'id');
  }

  public function propertyCityContents()
  {
    return $this->hasMany(CityContent::class, 'language_id', 'id');
  }

  public function propertyContents(){
    return $this->hasMany(Content::class,'language_id','id');
  }

  public function propertySpecificationContents()
  {
    return $this->hasMany(SpacificationCotent::class, 'language_id', 'id');
  }

  public function projectContents(){
    return $this->hasMany(ProjectContent::class,'language_id','id');
  }

  public function projectSpecificationContents()
  {
    return $this->hasMany(SpacificationContent::class, 'language_id', 'id');
  }

  public function projectTypeContents()
  {
    return $this->hasMany(ProjectTypeContent::class, 'language_id', 'id');
  }
}
