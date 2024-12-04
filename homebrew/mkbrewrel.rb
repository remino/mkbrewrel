class {{CLASSNAME}} < Formula
	desc "{{DESCRIPTION}}"
	homepage "{{HOMEPAGE}}"
	url "{{URL}}"
	sha256 "{{SHA256}}"
	version "{{VERSION}}"
	license "{{LICENSE}}"

	def install
		libexec.install "{{NAME}}"
		lib.install Dir["lib/*"]
		man1.install "man/{{NAME}}.1"

		(bin/"mkx").write <<~EOS
			#!/usr/bin/env bash
			export MKBREWREL_LIB_DIR="#{lib}"
			exec "#{libexec}/{{NAME}}" "$@"
		EOS
	end

	test do
		system "./{{NAME}}", "-v"
	end
end
