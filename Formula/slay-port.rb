class SlayPort < Formula
  desc "kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.1/slay-darwin-arm64"
      sha256 "30325dfb075ec70fc9d8aee411999927d7d2dfb0be610dda4e060980b37f7562"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.1/slay-darwin-x64"
      sha256 "2b9f6acbd755bb8e968facc2b0662ddc89c788a1bb918d62982ea495aee57ba3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.1/slay-linux-arm64"
      sha256 "a8ee0c9b3486d021a5b882a812c93e03be16bcd7be64eb0f27f306ee54570a01"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.1/slay-linux-x64"
      sha256 "6259bce232d1d9eda4e8ffd24dddb73aef6e2905abd985c08740532cc12a903d"
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
