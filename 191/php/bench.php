<?php

//require './func.php';
//require './func_untyped.php';
//require './imperative_untyped.php';
// require './func_untyped_notstrict.php';
//require './func_untyped_notstrict_noswitch_shortcall.php';
//require './func_untyped_notstrict_noswitch_shortcall_cache.php';
//require './func_untyped_notstrict_cache.php';
//require './imperative_buckets.php';
require './imperative_buckets_arb.php';


$n = $_SERVER['argv'][1];

$startTime = microtime(true);
$res = main($n);
$endTime = microtime(true);

$spent = $endTime - $startTime;

$res = (string) $res;

print "Result: $res\n";
print "Time: $spent\n";

