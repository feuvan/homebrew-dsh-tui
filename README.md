# Homebrew tap for `dsh-tui`

`dsh-tui` is the prebuilt terminal UI from the
[`feuvan/deepseek-harness`](https://github.com/feuvan/deepseek-harness) fork.
It runs the TUI without requiring Node.js or pnpm.

## Install

```sh
brew tap feuvan/dsh-tui
brew install dsh-tui
```

Or in one command:

```sh
brew install feuvan/dsh-tui/dsh-tui
```

Run it from any project directory:

```sh
dsh-tui
```

## Desktop coexistence

The formula installs only `dsh-tui`. It does **not** install, replace, or
shadow a Desktop-installed `dsh` command. It uses the shared `~/.dsh` home
and its own `~/.dsh/profiles/tui` profile.

## Supported platforms

- macOS arm64 / x86_64
- Linux x86_64 / arm64 (glibc-based distributions)

## Source / releases

- Source: https://github.com/feuvan/deepseek-harness
- Releases: https://github.com/feuvan/deepseek-harness/releases
- Source-install Gist: https://gist.github.com/feuvan/9426596ae9129f147b1d6bf17a4fa167
