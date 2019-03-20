setup:
	brew update
	brew upgrade mint || brew install mint || true
	mint bootstrap

code-format:
	swiftformat .