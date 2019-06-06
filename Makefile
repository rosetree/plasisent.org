.PHONY: all build docker-build docker-run style
.FORCE: build docker-run

SASS_CMD = sass --default-encoding utf-8 --style compact
USER_GROUP = $(shell id -u):$(shell id -g)

all: docker-run

docker-run:
	docker run \
		--volume $(shell pwd):/usr/src/app \
		--user $(USER_GROUP) \
		plasisent:latest

docker-build: Dockerfile Gemfile Gemfile.lock
	docker build -t plasisent .

build:
	bundle exec nanoc

# output/: style content/* content/**/* layout/* layout/**/*
# 	nanoc

style: content/assets/styles/critical.css content/assets/styles/master.css

content/assets/styles/critical.css: src/styles/critical.scss src/styles/_colors.scss
	$(SASS_CMD) src/styles/critical.scss > content/assets/styles/critical.css

content/assets/styles/master.css: src/styles/master.scss src/styles/_*.scss
	$(SASS_CMD) src/styles/master.scss > content/assets/styles/master.css
