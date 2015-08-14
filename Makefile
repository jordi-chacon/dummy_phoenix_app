SHELL := /bin/bash

.PHONY: docker clean

release:
	echo "Y" | mix local.rebar
	mix local.hex --force
	mix deps.get
	mix compile
	mix release
