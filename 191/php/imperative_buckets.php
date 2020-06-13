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

    $buckets = [
        'o' => [],
        'O' => [],
        'a' => [],
        'A' => [],
        'b' => [],
        'B' => [],
    ];
    $buckets['o'][$n] = 1;

    while ($n) {
        $next = $n - 1;
        foreach ($buckets as $key => $data) {
            if (array_key_exists($n, $data)) {
                $count = $data[$n];
                foreach (MAP[$key] as $nextKey) {
                    @$buckets[$nextKey][$next] += $count;
                }
            }
        }

        --$n;
    }

    $count = 0;
    foreach ($buckets as $data) {
        $count += $data[0];
    }

    return $count;
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
