.PHONY: check run all

all: check run

prize: lib/bench.ex lib/fast_prize.ex lib/prize.ex lib/concurent_prize.ex lib/concurrent_message_no_switch_prize.ex \
 		lib/fast_no_switch_prize.ex lib/fast_no_switch_tail_prize.ex lib/fast_no_switch_tail_no_counter_short_call_prize.ex \
 		lib/fast_no_switch_tail_no_counter_short_call_prize_ets_cache.ex lib/generations_prize.ex lib/buckets_prize.ex \
 		lib/buckets_optimized_prize.ex
	mix escript.build

check: prize
	./prize 4
	./prize 10

run: prize
	./prize 20
	./prize 25
	./prize 30
	./prize 35
	./prize 65

arb: prize
	./prize 365
	./prize 3650
	./prize 36500
	./prize 365000
