class {{class_name}} < Formula
	desc "{{description}}"
	homepage "{{homepage}}"
	url "{{url}}"
	sha256 "{{sha256}}"
	version "{{version}}"
	license "{{license}}"

	def install
		libexec.install "{{name}}"
		lib.install Dir["lib/*"]
		man1.install "man/{{name}}.1"

		(bin/"mkbrewrel").write <<~EOS
			#!/usr/bin/env bash
			export MKBREWREL_LIB_DIR="#{lib}"
			exec "#{libexec}/{{name}}" "$@"
		EOS
	end

	test do
		system "./{{name}}", "-v"
	end
end
