<?php

const LATE = -1;
const ABSENT = -2;
const ONTIME = -3;

function run($lateCount, $absentCount, $daysToGo)
{
    if ($absentCount > 2 or $lateCount > 1) {
        return 0;
    }

    if ($daysToGo === 0) {
        return 1;
    }

    return check(LATE, $lateCount, $absentCount, $daysToGo)
        +  check(ONTIME, $lateCount, $absentCount, $daysToGo)
        +  check(ABSENT, $lateCount, $absentCount, $daysToGo);
}

function check($today, $lateCount, $absentCount, $daysToGo)
{
    $nextDay = $daysToGo -1;

    if ($today === ONTIME) {
        return run($lateCount, 0, $nextDay);
    }
    if ($today === LATE) {
        return run($lateCount + 1, 0, $nextDay);
    }

    return run($lateCount, $absentCount + 1, $nextDay);
}

function main($n) {
    return run(0,0, $n);
}
