.PHONY: check run all arb

TARGET = ./buckets.lisp
RUN =

check:
	$(RUN) $(TARGET) 2
	$(RUN) $(TARGET) 4

run:
	$(RUN) $(TARGET) 10
	$(RUN) $(TARGET) 20
	$(RUN) $(TARGET) 30

arb:
	$(RUN) $(TARGET) 365
	$(RUN) $(TARGET) 3650
	$(RUN) $(TARGET) 36500
	$(RUN) $(TARGET) 365000
