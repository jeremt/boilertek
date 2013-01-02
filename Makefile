
all: clean test

test:
	@./bin/tek -t c -o my_project -l jeremt/list
	@tree my_project && cat my_project/Makefile

clean:
	@rm -rf my_project