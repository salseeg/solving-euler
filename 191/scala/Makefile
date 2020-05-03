.PHONY: check run all

check: Bench.class
	scala Bench 4

run:

all: check run

Bench.class: Bench.scala Prize.scala PrizeNoCounter.scala PrizeNoCounterNoTail.scala
	scalac Bench.scala Prize.scala PrizeNoCounter.scala PrizeNoCounterNoTail.scala

