.PHONY: all check run

all: check run

check:
	php bench.php 4
	php bench.php 10

run: func.php
	php bench.php 20
	php bench.php 30
	php bench.php 65

arb: func_untyped_notstrict_noswitch_shortcall_cache.php
	php bench.php 365
	php bench.php 3650
	php bench.php 36500
	php bench.php 365000

