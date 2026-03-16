class SlayPort < Formula
  desc "Kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.2/slay-darwin-arm64"
      sha256 "2c0fbbfe54e912ed33e4b9ea7b337e29ec29e3672bbb997f167bd35ebe5ca6db"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.2/slay-darwin-x64"
      sha256 "39f78405ed47c9f2b939ee73b0b12760158120f01bdb49e583f98ac97666c6e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.2/slay-linux-arm64"
      sha256 "1838729949284ee7bbd644aa0fcb76914b2502eb8d9d899609c4ad17a8e0b796"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.2/slay-linux-x64"
      sha256 "17087f5e20bc5c4d136f8461eaa100dbcc1a71a4e0d499846871382ab5b85a85"
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
