class Kib < Formula
  desc "The Headless Knowledge Compiler — turn raw sources into a queryable AI wiki"
  homepage "https://github.com/keeganthomp/kib"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-arm64"
      sha256 "ae0b180d16413cdcfd383c3e9dcb5d1febe18574a850d7abb90bc7b22eb4b151"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-darwin-x64"
      sha256 "6f6b55adf515495034b6f5cd13d06e4ecb3a16934822b46a2fb4516020de6c23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-arm64"
      sha256 "50b10f4dbfb39d4b5ad36a4ecb6875e6235a3561863cc76a959f37e4fccb08e9"
    else
      url "https://github.com/keeganthomp/kib/releases/download/v#{version}/kib-linux-x64"
      sha256 "64d470718f54ad6c9eee6758fda8d7661ab61f4157a4ac0a7e47f0705af21280"
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
