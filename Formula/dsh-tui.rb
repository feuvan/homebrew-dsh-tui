class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.4-20261118.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.1/dsh-tui-0.2.2-rc.4-20261118.1-macos-arm64.tar.gz"
      sha256 "92d25197f9db4b339b8075ec512fb0b92c7901d80bcff35fc1e77cc289519242"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.1/dsh-tui-0.2.2-rc.4-20261118.1-macos-x64.tar.gz"
      sha256 "9cc012c7c96014836f7da4eaa784ccbda018a19374f2c52770e2a9155e0382c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.1/dsh-tui-0.2.2-rc.4-20261118.1-linux-arm64.tar.gz"
      sha256 "ff99c22b22cb211c9c0bcf3eb9023d740035ef985bad617a587c424be0943ef0"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.1/dsh-tui-0.2.2-rc.4-20261118.1-linux-x64.tar.gz"
      sha256 "c973dc5020cb15c61180d990040508bedc8107bc216ec3544e3ad7094c7931c2"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"dsh-tui").write <<~SH
      #!/bin/sh
      exec "#{libexec}/dsh-tui" tui "$@"
    SH
    chmod 0755, bin/"dsh-tui"
  end

  def caveats
    <<~EOS
      This installs `dsh-tui`, not `dsh`; a Desktop-installed `dsh` command is
      left untouched. The TUI uses the shared ~/.dsh home and its own
      ~/.dsh/profiles/tui profile.
    EOS
  end

  test do
    assert_match "Usage: dsh", shell_output("#{bin}/dsh-tui --help")
  end
end
