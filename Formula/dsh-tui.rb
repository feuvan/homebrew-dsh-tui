class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.1-20261111.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.1-20261111.1/dsh-tui-0.2.2-rc.1-20261111.1-macos-arm64.tar.gz"
      sha256 "1f3b4b213e6fed7ef6fd200d38194708e366d55deb760fd3667dac659a27b0df"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.1-20261111.1/dsh-tui-0.2.2-rc.1-20261111.1-macos-x64.tar.gz"
      sha256 "533ecc0b7c697a25222109bdeff86b5d2ab7e1ec6bea46ec6dff6bfc84643e3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.1-20261111.1/dsh-tui-0.2.2-rc.1-20261111.1-linux-arm64.tar.gz"
      sha256 "551812ae3e2556f9ddd09f2c2703713d65a5ba3f65fefb542876ce4de6d77800"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.1-20261111.1/dsh-tui-0.2.2-rc.1-20261111.1-linux-x64.tar.gz"
      sha256 "4d50c7e6217acc6a27a5519480c60d57aa25dbd12b2bc39af580afdc900ea7d2"
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
