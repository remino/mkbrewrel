#!/usr/bin/env bats

teardown() {
	[ -z "$OUTPUT_FILE" ] && return 0
	[ ! -f "$OUTPUT_FILE" ] && return 0
	rm -f "$OUTPUT_FILE"
}

@test "shows version" {
	local version="$( grep VERSION ./mkbrewrel | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' | head -1 )"

	run ./mkbrewrel -v

	[ "$status" -eq 0 ]
	[ "$output" = "mkbrewrel $version" ]
}

@test "shows help" {
	run ./mkbrewrel -h

	[ "$status" -eq 0 ]
	[ "${output:0:10}" = "mkbrewrel " ]
}

@test "generates Homebrew formula with default template" {
	OUTPUT_FILE=

	local expected_output="$( cat tests/fixtures/sample.rb )"

	run ./mkbrewrel -s

	[ "$status" -eq 0 ]
	[ "$output" = "$expected_output" ]
}

@test "generates Homebrew formula with custom template" {
	OUTPUT_FILE=

	local expected_output="$( cat tests/fixtures/custom.rb )"

	run ./mkbrewrel -s -t tests/fixtures/custom.rb.mustache

	[ "$status" -eq 0 ]
	[ "$output" = "$expected_output" ]
}
