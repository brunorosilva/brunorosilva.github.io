.PHONY: install serve build clean

# Default target
all: install serve

mac_install: 
	@brew install hugo

# Install Hugo if not present
install:
	@if ! command -v hugo > /dev/null; then \
		echo "Installing Hugo..."; \
		wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.115.4/hugo_extended_0.115.4_linux-amd64.deb; \
		sudo dpkg -i /tmp/hugo.deb; \
		rm /tmp/hugo.deb; \
	fi

# Start Hugo server for local development
serve:
	hugo server -D

# Build the site
build:
	hugo --gc --minify

# Clean generated files
clean:
	rm -rf public/

# Help command
help:
	@echo "Available commands:"
	@echo "  make install  - Install Hugo if not present"
	@echo "  make serve    - Start Hugo server for local development"
	@echo "  make build    - Build the site"
	@echo "  make clean    - Remove generated files"
	@echo "  make help     - Show this help message" 