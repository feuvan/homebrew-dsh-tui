class DshTui < Formula
  desc "DeepSeek Harness terminal UI fork (prebuilt runtime)"
  homepage "https://github.com/feuvan/deepseek-harness"
  version "0.2.2-rc.4-20261118.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.3/dsh-tui-0.2.2-rc.4-20261118.3-macos-arm64.tar.gz"
      sha256 "7497a3a0f7a29b1280dd62d236b6e365a3d886e5565169cf89d47c32386a07ba"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.3/dsh-tui-0.2.2-rc.4-20261118.3-macos-x64.tar.gz"
      sha256 "c464ee127b1a6de5c0de7f9aca7bdd577ac726adc8fefbcb6090cfb57d8e427a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.3/dsh-tui-0.2.2-rc.4-20261118.3-linux-arm64.tar.gz"
      sha256 "4f79ec4fb410fefabec4c185b5b6a3182a1120641a8abb35db11fa90b05492a7"
    else
      url "https://github.com/feuvan/deepseek-harness/releases/download/dsh-tui-v0.2.2-rc.4-20261118.3/dsh-tui-0.2.2-rc.4-20261118.3-linux-x64.tar.gz"
      sha256 "47da80a733bc093754325677988a738b7fbb39f7f8139dfaa380a89f9dc513eb"
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
