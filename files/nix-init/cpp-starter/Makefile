PROJECT_NAME := cpp-starter

.PHONY: clean build run

clean:
	rm -rf build/*

build:
	g++ src/main.cpp -o build/$(PROJECT_NAME)

run: build
	build/$(PROJECT_NAME)
