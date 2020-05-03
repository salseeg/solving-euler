<?php

//require './func.php';
//require './func_untyped.php';
//require './imperative_untyped.php';
// require './func_untyped_notstrict.php';
require './func_untyped_notstrict_noswitch_shortcall.php';

$n = $_SERVER['argv'][1];

$startTime = microtime(true);
$res = main($n);
$endTime = microtime(true);

$spent = $endTime - $startTime;

print "Result: $res\n";
print "Time: $spent\n";
