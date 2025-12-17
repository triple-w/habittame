<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('basic_settings', function (Blueprint $table) {
            $table->integer('property_approval_status')->default(1)->comment('1= need admin approval then show in frontend');
            $table->integer('project_approval_status')->default(1)->comment('1= need admin approval then show in frontend');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('basic_settings', function (Blueprint $table) {
            $table->dropColumn('property_approval_status');
            $table->dropColumn('project_approval_status');
        });
    }
};
