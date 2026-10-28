class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  license "MIT"
  version "0.2.2-alpha.2-20261028"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028/dsh-tui-0.2.2-alpha.2-20261028-macos-arm64.tar.gz"
      sha256 "1f461c8379cbe58db515e2432cbcc65218f42ae063fe1d056b3b46e620d19eec"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028/dsh-tui-0.2.2-alpha.2-20261028-macos-x64.tar.gz"
      sha256 "728d2540fdd51870237e3a5ee19fcf3b53515fb2f732923d74339ab4d27b9fa5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028/dsh-tui-0.2.2-alpha.2-20261028-linux-arm64.tar.gz"
      sha256 "e747ed89916cdf2c52ac1e19558793ac2dc82fd58027eef2c8ce05b7efced898"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028/dsh-tui-0.2.2-alpha.2-20261028-linux-x64.tar.gz"
      sha256 "98d3cd1af2a5fa7fcf56d9aab15d11ecf933061033575cfd7ed5c0d4557cf167"
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
