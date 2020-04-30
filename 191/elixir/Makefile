.PHONY: check run all

all: check run

prize: lib/bench.ex lib/fast_prize.ex lib/prize.ex lib/concurent_prize.ex
	mix escript.build

check: prize
	./prize 20

run: prize
	./prize 30
