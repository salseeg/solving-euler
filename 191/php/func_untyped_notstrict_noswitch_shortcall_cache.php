<?php

$cache = [];
$lCache = [];

function run($days)
{
    global $cache;

    if (array_key_exists($days, $cache)) {
        return $cache[$days];
    }
    $result = $days == 1
        ? 3
        : runL($days - 1) + run($days - 1) + runA($days - 1);
    $cache[$days] = $result;

    return $result;
}

function runL($days)
{
    global $lCache;
    if (array_key_exists($days, $lCache)) {
        return $lCache[$days];
    }
    $result = ($days == 1)
        ? 2
        : runL($days-1) + runLA($days-1);
    $lCache[$days] = $result;

    return $result;
}

function runA($days)
{
    if ($days == 1) return 3;
    return runL($days-1) + run($days-1) + runAA($days-1);
}

function runLA($days)
{
    if ($days == 1) return 2;
    return runL($days-1) + runLAA($days-1);
}

function runAA($days)
{
    if ($days == 1) return 2;
    return runL($days-1) + run($days-1);
}

function runLAA($days)
{
    if ($days == 1) return 1;
    return runL($days-1);
}

function main($n) {
    return run($n);
}
