<?php

function run($lateCount, $absentCount, $daysToGo)
{
    if ($absentCount > 2 or $lateCount > 1) {
        return 0;
    }

    if ($daysToGo == 0) {
        return 1;
    }

    return run($lateCount + 1, 0, $daysToGo - 1)
        + run($lateCount, 0, $daysToGo - 1)
        + run($lateCount, $absentCount + 1, $daysToGo - 1);
}

function main($n) {
    return run(0,0, $n);
}
