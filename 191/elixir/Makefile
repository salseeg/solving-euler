.PHONY: check run all

all: check run

prize: lib/bench.ex lib/fast_prize.ex lib/prize.ex lib/concurent_prize.ex lib/concurrent_message_no_switch_prize.ex \
 		lib/fast_no_switch_prize.ex lib/fast_no_switch_tail_prize.ex lib/fast_no_switch_tail_no_counter_short_call_prize.ex
	mix escript.build

check: prize
	./prize 4

run: prize
	./prize 20
	./prize 30
