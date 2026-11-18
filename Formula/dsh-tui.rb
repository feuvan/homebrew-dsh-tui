class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.4-20261118.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.5/dsh-tui-0.2.2-rc.4-20261118.5-macos-arm64.tar.gz"
      sha256 "48bf456626efe12f5181e20c0a12b2e286c78cb1b6943eca8bbfb3e022b56476"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.5/dsh-tui-0.2.2-rc.4-20261118.5-macos-x64.tar.gz"
      sha256 "e10a9e3bb5e73019f1a79894c4c4514a597ab2834abe825d167aa4fbec14790a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.5/dsh-tui-0.2.2-rc.4-20261118.5-linux-arm64.tar.gz"
      sha256 "bbdb64911413f3336c424925b4d0471008fca545e02735160c65812355e8b90f"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.5/dsh-tui-0.2.2-rc.4-20261118.5-linux-x64.tar.gz"
      sha256 "a35e7d36f05d5ee80a7920ccd6742d173c65d8253732e0b88c8ecbe2aed2ef3a"
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
