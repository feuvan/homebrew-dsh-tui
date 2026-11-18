class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.4-20261118.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.4/dsh-tui-0.2.2-rc.4-20261118.4-macos-arm64.tar.gz"
      sha256 "5160f34297c2aa93e06c3bad4701fe1596d989b2e3113e49a523c180aa37a102"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.4/dsh-tui-0.2.2-rc.4-20261118.4-macos-x64.tar.gz"
      sha256 "6c90f5caa6b4235c8c0fad5c1bab228ddb97f353d878057496f4dd71f6b1274d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.4/dsh-tui-0.2.2-rc.4-20261118.4-linux-arm64.tar.gz"
      sha256 "fa62a2ead12f03763d30f2fd99e5349757f9cb559dc0a65fd70a69a746ef133b"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.4/dsh-tui-0.2.2-rc.4-20261118.4-linux-x64.tar.gz"
      sha256 "e56b5b5bf595c3f7b2c118babe81fc7f2f51e3c64d1f38c2aac350e38b27792b"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"dsh-tui").write <<~SH
      #!/bin/sh
      root="#{libexec}"
      case "${1-}" in
        plugin)
          shift
          has_profile=0
          for argument in "$@"; do
            case "$argument" in
              --profile|--profile=*) has_profile=1 ;;
            esac
          done
          if [ "$has_profile" -eq 0 ]; then
            set -- --profile tui "$@"
          fi
          exec "$root/dsh-tui" plugin "$@"
          ;;
      esac
      exec "$root/dsh-tui" tui "$@"
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
    assert_match "Usage: dsh plugin", shell_output("#{bin}/dsh-tui plugin --help")
  end
end
