<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontEnd\MiscellaneousController;
use App\Models\CustomPage\Page;
use App\Models\CustomPage\PageContent;
use Illuminate\Http\Request;

class PageController extends Controller
{
  public function page($slug)
  {
    $misc = new MiscellaneousController();

    $language = $misc->getLanguage();
    $queryResult['bgImg'] = $misc->getBreadcrumb();
    $page_content = PageContent::where('slug', $slug)->firstOrFail();
    $queryResult['pageInfo'] = Page::join('page_contents', 'pages.id', '=', 'page_contents.page_id')
      ->where('pages.status', '=', 1)
      ->where('page_contents.page_id', $page_content->page_id)
      ->where('page_contents.language_id', '=', $language->id)
      ->firstOrFail();

    return view('frontend.custom-page', $queryResult);
  }
}
