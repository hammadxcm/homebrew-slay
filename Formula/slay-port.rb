class SlayPort < Formula
  desc "Kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v#{version}/slay-darwin-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v#{version}/slay-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v#{version}/slay-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v#{version}/slay-linux-x64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    binary = Dir.glob("slay-*").first
    mv binary, "slay"
    bin.install "slay"
  end

  test do
    assert_match "slay", shell_output("#{bin}/slay --help")
  end
end
