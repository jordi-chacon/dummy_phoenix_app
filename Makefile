SHELL := /bin/bash

.PHONY: docker clean

test_missing_files: create_binary
	docker build -t dummy_phoenix_app .
	printf "\n\n\n[INFO] Running Docker container now. Printing diff between directories:\n\n"
	docker run -it dummy_phoenix_app

create_binary:
	echo "Y" | mix local.rebar
	mix local.hex --force
	mix deps.get
	mix compile
	mix release
	cp rel/dummy_phoenix_app/releases/0.0.1/dummy_phoenix_app.tar.gz binary.tar.gz

clean:
	rm -rf _build rel deps binary.tar.gz
