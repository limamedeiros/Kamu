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

dependencies:
	carthage update --no-use-binaries --platform iOS

unit-tests:
	bitrise run unit-tests