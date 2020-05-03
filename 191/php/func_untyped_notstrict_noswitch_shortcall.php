<?php

function run($days)
{
    if ($days == 1) return 3;
    return runL($days-1) + run($days-1) + runA($days-1);
}

function runL($days)
{
    if ($days == 1) return 2;
    return runL($days-1) + runLA($days-1);
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
