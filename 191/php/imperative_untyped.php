<?php

const INIT = 0;
const LATE = 1;
const ABSENT = 2;
const ONTIME = 3;
const DONE = 4;

function main(int $n)
{
    $prize = 0;
    $stack = [];
    $level = $n;
    $stack[$level] = [LATE, 0, 0];  // today, $lateCount , $absentCount


    while (true) {
        $today = $stack[$level][0];

        if ($today == DONE) {
            if ($level == $n) {
                break;
            }
            ++ $level; continue;
        }

        ++ $stack[$level][0]; // for next return

        $late = $today == LATE
            ? $stack[$level][1] + 1
            : $stack[$level][1];
        if ($late == 2) continue;

        $absent = $today == ABSENT
            ? $stack[$level][2] + 1
            : 0;
        if ($absent == 3) continue;


        if ($level == 1) {
            ++ $prize;
            continue;
        }

        // call in
        -- $level;
        $stack[$level] = [LATE, $late, $absent];

    }


    return $prize;

}
