class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.4-20261118.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.2/dsh-tui-0.2.2-rc.4-20261118.2-macos-arm64.tar.gz"
      sha256 "e328c893396f9e47f500be182b09101f2f01070bbc5a7f6de5344ebe792c0752"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.2/dsh-tui-0.2.2-rc.4-20261118.2-macos-x64.tar.gz"
      sha256 "18c3910dc8902084da47225e7196ea2caa2a455d97a0ce09f2df1ac00854b6ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.2/dsh-tui-0.2.2-rc.4-20261118.2-linux-arm64.tar.gz"
      sha256 "bdd3815309dea55ab3a21355f166afd6fbdcc1ac8c07d2aeea93bb5a2cbe0f90"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.2/dsh-tui-0.2.2-rc.4-20261118.2-linux-x64.tar.gz"
      sha256 "bba177ae3ac4526b8e0f6d9a6ac724ab2b91c91812ddc2def06f747f186eb5c1"
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
