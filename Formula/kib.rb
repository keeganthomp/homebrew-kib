class Kib < Formula
  desc "The Headless Knowledge Compiler — turn raw sources into a queryable AI wiki"
  homepage "https://github.com/keeganthomp/kib"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-arm64"
      sha256 "b04f92fc8cbabeaf1e248c9514b4b5ce940bfe4deb3bf6a23d162b0c6d6b0c6a"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-x64"
      sha256 "e86fb8f626b7352d62def961eb0534d68ca3be06bb7f7f57fa65e3f9aa582e74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-arm64"
      sha256 "bb7f5b141292e35b00c76c61f88e4093848c0a719158d728c7d6109c31003dfc"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-x64"
      sha256 "cafc1cdb40108c5ba04a716da8a7ad26bf8e72f40061d979a496d6bd9261cd00"
    end
  end

  def install
    binary = Dir["kib-*"].first || "kib"
    bin.install binary => "kib"
  end

  test do
    assert_match "kib", shell_output("#{bin}/kib --version")
  end
end
