closure	17.04s      146000                 functional
python  17.03s      183000			2.7

erlang  17.08s      283000    x1                    erl -noshell -run euler7 main 283000
php7.3  11.03s      283000   erl x1.54                 iterational
        17.01s      377000
node10   1.89s      283000   erl x9                       iterational, stack is limited, no tail call optimisation
         2.91s      377000   php x5.84
        17.05s     1204000
c        1.23s      283000   erl x13.89
         1.82s      377000   php x9.35   
        10.12s     1204000   node x1.68
        17.01s     1710000

pypy    17.19s      650000
