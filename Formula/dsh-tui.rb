class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-alpha.2-20261028.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.3/dsh-tui-0.2.2-alpha.2-20261028.3-macos-arm64.tar.gz"
      sha256 "76f1d399d8fd05e277bc8395a313899f71624a61238c9781165abf68a69ba8bc"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.3/dsh-tui-0.2.2-alpha.2-20261028.3-macos-x64.tar.gz"
      sha256 "42f4b862e8d397084b10022b8a9d9c4d5fb99f76aaf693e91b86b6d41bc8836e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.3/dsh-tui-0.2.2-alpha.2-20261028.3-linux-arm64.tar.gz"
      sha256 "2dce055dc51b7e85950a21fadd8fd1d25577604a7118d9d96d4e4049f9fe76e2"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.3/dsh-tui-0.2.2-alpha.2-20261028.3-linux-x64.tar.gz"
      sha256 "74994af3b920d73e750d34c4011317dc7946b0c64d478210e67bd155aea90977"
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
