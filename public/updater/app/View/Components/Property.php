<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Property extends Component
{

    public $property;

    public  $animation;

    protected $except = [];


    public function __construct($property, $animate = true)
    {

        $this->property = $property;
        $this->animation = $animate;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.property');
    }
}
