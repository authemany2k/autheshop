<?php

namespace App\Shop\Tools;

use Illuminate\Http\UploadedFile;

trait UploadableTrait
{
    /**
     * Upload a single file in the server
     *
     * @param UploadedFile $file
     * @param null $folder
     * @param string $disk
     * @param null $filename
     * @return false|string
     */
    public function uploadOne(UploadedFile $file, $folder = null, $disk = 'uploads', $filename = null)
    {
        $name = !is_null($filename) ? $filename : str_random(25);

        return $file->storeAs(
//        return request()->file('cover')->storeAs(
            $folder,
            $name . "." . $file->getClientOriginalExtension(),
            $disk);
    }
}