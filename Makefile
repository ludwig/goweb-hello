# -*- Makefile -*-

build:
	docker build -t ludwig/goweb-hello:latest .

push:
	docker push ludwig/goweb-hello:latest

run:
	docker run -d --rm --name goweb-hello -p 8080:8080 ludwig/goweb-hello:latest

stop:
	docker stop goweb-hello

open-browser:
	python3 -m webbrowser -t http://localhost:8080/World

