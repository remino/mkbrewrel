class Example < Formula
  # Custom formula

	desc "Sample description."
	homepage "https://example.com"
	url "https://example.com/example.tar.gz"
	sha256 "abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890"
	version "1.2.3"
	license "ISC"

	def install
		bin.install "./example"
	end

	test do
		system "./example", "-v"
	end
end
