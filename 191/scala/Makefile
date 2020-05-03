.PHONY: check run all

check: Bench.class
	scala Bench 4

run:
	scala Bench 10
	scala Bench 20
	scala Bench 30
	scala Bench 35

all: check run

Bench.class: Bench.scala Prize.scala PrizeNoCounter.scala PrizeNoCounterNoTail.scala PrizeNoCounterNoTailShortCall.scala
	scalac Bench.scala Prize.scala PrizeNoCounter.scala PrizeNoCounterNoTail.scala PrizeNoCounterNoTailShortCall.scala

