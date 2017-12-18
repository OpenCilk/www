WEBDIR = /mit/cilk/web_scripts/newsite

LOCAL_SITE = ./_site

.PHONY: default all publish

default: all

all:
	bundle exec jekyll build --destination $(LOCAL_SITE)  # Builds the website into $(LOCAL_SITE)

publish: all
	@if [ ! -d $(WEBDIR) ]; \
	then echo "ERROR: Unable to publish webpage to $(WEBDIR)"; \
	else \
	echo "scp -r $(LOCAL_SITE)/* $(WEBDIR)/"; \
	scp -r $(LOCAL_SITE)/* $(WEBDIR)/; \
	fi
