PROJECT_NAME := c-starter

.PHONY: clean build run

clean:
	rm -rf build/*

build:
	gcc src/main.c -o build/$(PROJECT_NAME)

run: build
	build/$(PROJECT_NAME)
