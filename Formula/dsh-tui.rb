class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-alpha.2-20261028.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.2.2/dsh-tui-0.2.2-alpha.2-20261028.2-macos-arm64.tar.gz"
      sha256 "331cff145925552f8a999275d81d970e3039c5159b05501e2926820660bcc4bd"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.2.2/dsh-tui-0.2.2-alpha.2-20261028.2-macos-x64.tar.gz"
      sha256 "07dc1bc9a32eeda06da26e273055db88437916003068a87438fd6b4e698093ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.2.2/dsh-tui-0.2.2-alpha.2-20261028.2-linux-arm64.tar.gz"
      sha256 "0c8779b7dd0a2430452e83a35f3052394a2ad88d2029b4cda2d2bd6236137f9c"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-alpha.2-20261028.2.2/dsh-tui-0.2.2-alpha.2-20261028.2-linux-x64.tar.gz"
      sha256 "fc0cfd02595abb6ac3583bd6c1c1ba3f86cb1dfae2aeaaca32c4c711468a57bf"
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
