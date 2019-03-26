setup:
	brew update
	brew upgrade mint || brew install mint || true
	brew upgrade bitrise || brew install bitrise || true
	mint bootstrap

build:
	xcodebuild -scheme Debug

clean:
	xcodebuild clean

check:
	bitrise run develop

code-format:
	swiftformat .

unit-tests:
	bitrise run unit-tests