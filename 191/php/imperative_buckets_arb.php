<?php

const MAP = [
    'o' => ['O','o','a'],
    'O' => ['O','A'],
    'a' => ['O','o','b'],
    'A' => ['O','B'],
    'b' => ['O','o'],
    'B' => ['O'],
];


function main($n) {

    $bucket = [1,0,0,0,0,0];

    while ($n) {
        [$o, $l, $a, $la, $aa, $laa] = $bucket;

        $bucket[0] = bcadd(bcadd($aa, $a), $o);
        $bucket[1] = bcadd(bcadd(bcadd($o, $l), bcadd($a, $la)), bcadd($aa, $laa));
        $bucket[2] = $o;
        $bucket[3] = $l;
        $bucket[4] = $a;
        $bucket[5] = $la;

        --$n;
    }

    [$o, $l, $a, $la, $aa, $laa] = $bucket;

    return bcadd(bcadd(bcadd($o, $l), bcadd($a, $la)), bcadd($aa, $laa));
}

/**
 * @param $str
 * @param $newStr
 * @return string
 */
function morph($str)
{
    $newStr = '';
    $len = strlen($str);
    for ($i = 0; $i < $len; ++$i) {
        $newStr .= MAP[$str[$i]];
    }
    return $newStr;
}
