class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-alpha.2-20261101.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261101.1/dsh-tui-0.2.2-alpha.2-20261101.1-macos-arm64.tar.gz"
      sha256 "0dc749bef9db0db69dee361030130a60f4f22b223613f01d528f8e332a51555d"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261101.1/dsh-tui-0.2.2-alpha.2-20261101.1-macos-x64.tar.gz"
      sha256 "b614fe2c5b385365ced3c92f866c673bf5629c9ac2d8b6b129ba8ebc510f71ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261101.1/dsh-tui-0.2.2-alpha.2-20261101.1-linux-arm64.tar.gz"
      sha256 "9f8eba62e6e77521a85c7c2e0e1e89ffc08a63cb8ed3d2d2b837592e793660ba"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261101.1/dsh-tui-0.2.2-alpha.2-20261101.1-linux-x64.tar.gz"
      sha256 "63f0d4ec4775ab6de425fcf08a778954454a670e9a7653e91eb6fe7da86c880f"
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
