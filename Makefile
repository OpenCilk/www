WEBDIR = /mit/cilk/web_scripts

LOCAL_SITE = ./_site

JEKYLL_BUILD = bundle exec jekyll build --destination $(LOCAL_SITE) # Builds the website into $(LOCAL_SITE)

.PHONY: default all udpate publish

default: all

update: Gemfile Gemfile.lock
	bundle update

all: update
	$(JEKYLL_BUILD)

publish: all
	JEKYLL_ENV=production $(JEKYLL_BUILD)
	@if [ ! -d $(WEBDIR) ]; \
	then echo "ERROR: Unable to publish webpage to $(WEBDIR)"; \
	else \
	echo "scp -r $(LOCAL_SITE)/* $(WEBDIR)/"; \
	scp -r $(LOCAL_SITE)/* $(WEBDIR)/; \
	fi
