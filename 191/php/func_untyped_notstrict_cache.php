<?php

class Cache
{
    static private $arr = [];

    static function has($key)
    {
        return array_key_exists($key, Cache::$arr);
    }

    static function get($key)
    {
        return Cache::$arr[$key];
    }

    static function set($key, $value)
    {
        Cache::$arr[$key] = $value;
    }

}

$cache = [];

function run($lateCount, $absentCount, $daysToGo)
{

//    if (Cache::has($daysToGo)) {
//        return Cache::get($daysToGo);
//    }

    $result = ($absentCount > 2 or $lateCount > 1)
        ? 0
        : (
            $daysToGo == 0
            ? 1
            : (
                run($lateCount + 1, 0, $daysToGo - 1)
                + run($lateCount, 0, $daysToGo - 1)
                + run($lateCount, $absentCount + 1, $daysToGo - 1)
            )
        );
    Cache::set($daysToGo, $result);

    return $result;

}

function main($n) {
    global $cache;
    print_r($cache);
    return run(0,0, $n);
}
