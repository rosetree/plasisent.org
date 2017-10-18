.PHONY: all build style
.FORCE: build

SASS_CMD = sass --style compact

all: style build

build:
	bundle exec nanoc

# output/: style content/* content/**/* layout/* layout/**/*
# 	nanoc

style: content/assets/styles/critical.css content/assets/styles/master.css

content/assets/styles/critical.css: src/styles/critical.scss src/styles/_colors.scss
	$(SASS_CMD) src/styles/critical.scss > content/assets/styles/critical.css

content/assets/styles/master.css: src/styles/master.scss src/styles/_*.scss
	$(SASS_CMD) src/styles/master.scss > content/assets/styles/master.css
