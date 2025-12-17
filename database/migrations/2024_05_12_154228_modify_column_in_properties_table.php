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

        // Modify min_price column
        DB::statement('ALTER TABLE projects MODIFY COLUMN min_price DECIMAL(15, 2) NULL');

        // Modify max_price column
        DB::statement('ALTER TABLE projects MODIFY COLUMN max_price DECIMAL(15, 2) NULL');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

        // Modify min_price column
        DB::statement('ALTER TABLE projects MODIFY COLUMN min_price DECIMAL(8, 2) NULL');

        // Modify max_price column
        DB::statement('ALTER TABLE projects MODIFY COLUMN max_price DECIMAL(8, 2) NULL');
    }
};
