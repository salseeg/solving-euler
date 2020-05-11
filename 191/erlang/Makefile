.PHONY: check run

#TARGET = generic
TARGET = optimized
RUN = erl -noshell -run

check: $(TARGET).beam
	$(RUN) $(TARGET) main 2
	$(RUN) $(TARGET) main 4

run:
	$(RUN) $(TARGET) main 10
	$(RUN) $(TARGET) main 20
	$(RUN) $(TARGET) main 30

$(TARGET).beam: $(TARGET).erl
	erlc $(TARGET).erl

