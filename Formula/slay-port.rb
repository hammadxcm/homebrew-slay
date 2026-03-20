class SlayPort < Formula
  desc "kill processes by port. Beautifully."
  homepage "https://slay.fyniti.co.uk"
  license "MIT"
  version "0.1.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.31/slay-darwin-arm64"
      sha256 "5e89cf35b96e767a76470586bf4d44eb4e8b65382575aeaaa01081fae29824ad"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.31/slay-darwin-x64"
      sha256 "684f73dbe335b9cb42064724cf57550bd25b68f84a3999a974d93f911073a18d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.31/slay-linux-arm64"
      sha256 "6a38e836304580e7d21eba2a937e2686dd5bbd96a1853032c07e69aa9d3b7f13"
    else
      url "https://github.com/hammadxcm/slay/releases/download/v0.1.31/slay-linux-x64"
      sha256 "d49c4a291b3bc8b3355a135ab1dab87ab2685b6b5a7cc5bc9c3de00f3238d5ff"
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
