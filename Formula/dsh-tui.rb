class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.1-rc.3/dsh-tui-0.2.1-rc.3-macos-arm64.tar.gz"
      sha256 "b5dbd4b30eea7514133898e9e94d1d852da16328b6248253afeeac2ea29247a5"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.1-rc.3/dsh-tui-0.2.1-rc.3-macos-x64.tar.gz"
      sha256 "446fb650deffbcc2243e9b3573b101b2fe6b850453bb9662e9cb572bb58031f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.1-rc.3/dsh-tui-0.2.1-rc.3-linux-arm64.tar.gz"
      sha256 "2df68400a687b1261d956ab516da0378e4dc6b39ee4d8ddeb8cf8e5dae749b06"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.1-rc.3/dsh-tui-0.2.1-rc.3-linux-x64.tar.gz"
      sha256 "768caa8ebcfb6c67e2769dace85bfb40eaba0d704071ab2c94a6f9d6a0c6907c"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"dsh-tui"
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
