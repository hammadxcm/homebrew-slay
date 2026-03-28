class SlayPort < Formula
  desc "kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.1.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.32/slay-darwin-arm64"
      sha256 "8622c83fb23007ccea983f5db686cd53e06b12cd017b0cbae468a9d463c3b3fb"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.32/slay-darwin-x64"
      sha256 "0a88f5ba0e3b9889d80273a7423a576830e468d963a25f7ae871220ee62c19d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.32/slay-linux-arm64"
      sha256 "6a25778bc64bc56a396e3bdba408bd798377384b334c9a8bdb30768e4fd6be29"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.32/slay-linux-x64"
      sha256 "c64f4d9b97f8c51275f5168b15ab5c5a5be093400af4da2045922be37234a026"
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
