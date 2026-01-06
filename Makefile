# Fabric Skills for Claude - Build System

SKILLS_DIR := skills
DIST_DIR := dist
SKILLS := $(notdir $(wildcard $(SKILLS_DIR)/*))

.PHONY: all clean build list help

# Default target
all: build

# Build all skill packages
build: $(DIST_DIR)
	@echo "Building skill packages..."
	@for skill in $(SKILLS); do \
		echo "  Packaging: $$skill"; \
		cd $(SKILLS_DIR) && zip -rq ../$(DIST_DIR)/$$skill.skill $$skill/ && cd ..; \
	done
	@echo "Done! Packages in $(DIST_DIR)/"
	@ls -lh $(DIST_DIR)/*.skill

# Create dist directory
$(DIST_DIR):
	@mkdir -p $(DIST_DIR)

# Clean build artifacts
clean:
	@echo "Cleaning..."
	@rm -rf $(DIST_DIR)
	@echo "Done!"

# List available skills
list:
	@echo "Available skills:"
	@for skill in $(SKILLS); do \
		patterns=$$(ls $(SKILLS_DIR)/$$skill/references/*.md 2>/dev/null | wc -l); \
		echo "  - $$skill ($$patterns patterns)"; \
	done

# Install skills to Claude directory
install: build
	@echo "Installing skills..."
	@if [ -z "$(CLAUDE_SKILLS_DIR)" ]; then \
		echo "Error: CLAUDE_SKILLS_DIR not set"; \
		echo "Usage: make install CLAUDE_SKILLS_DIR=~/.claude/skills"; \
		exit 1; \
	fi
	@for skill in $(SKILLS); do \
		echo "  Installing: $$skill"; \
		unzip -oq $(DIST_DIR)/$$skill.skill -d $(CLAUDE_SKILLS_DIR)/; \
	done
	@echo "Done!"

# Show help
help:
	@echo "Fabric Skills for Claude - Build System"
	@echo ""
	@echo "Usage:"
	@echo "  make build    - Build all .skill packages"
	@echo "  make clean    - Remove build artifacts"
	@echo "  make list     - List available skills"
	@echo "  make install  - Install to Claude (set CLAUDE_SKILLS_DIR)"
	@echo "  make help     - Show this help"
	@echo ""
	@echo "Example:"
	@echo "  make install CLAUDE_SKILLS_DIR=~/.claude/skills"
