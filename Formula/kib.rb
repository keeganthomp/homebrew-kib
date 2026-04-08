class Kib < Formula
  desc "The Headless Knowledge Compiler — turn raw sources into a queryable AI wiki"
  homepage "https://github.com/keeganthomp/kib"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-arm64"
      sha256 "e392010bd76850cf9a750422159469a4e9f8923208c36275e2000b5247b9c347"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-x64"
      sha256 "2913b01f4b89e7254b9852afcff12886d813adaf6dfbbb1e744672791e1bce1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-arm64"
      sha256 "64806984d0445de43de332b93d60e19c3fac2b2625949f7ba52b2f89f2974471"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-x64"
      sha256 "bcf8bd60197dafd1933aa3419f8be4bf43e2187130da91f1c0cf7dce4c84b98e"
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
