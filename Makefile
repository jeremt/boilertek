
all: clean test

test:
	@./bin/tek -t c -o tests/my_test -l jeremt/list
	@tree tests/my_test && cat tests/my_test/Makefile

clean:
	@rm -rf tests/*