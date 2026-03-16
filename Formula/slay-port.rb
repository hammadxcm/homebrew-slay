class SlayPort < Formula
  desc "Kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.0/slay-darwin-arm64"
      sha256 "2d9c7223286479b2f32f6ac2ab6b4c9535fb93e5d9d544b1546dc68b941b3f4e"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.0/slay-darwin-x64"
      sha256 "3c70eb6a775fb284f8c1700d59589a7acf6b27aaedb6073f16ee30367de34284"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.0/slay-linux-arm64"
      sha256 "36c453434f1f7f316a3938fd5a4a10355ed612266233ceb073e05a05359f53ef"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.2.0/slay-linux-x64"
      sha256 "e2643209c1260d00e2be64b02dd891316adf62a094c7e19e5b2f117ee513af4b"
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
