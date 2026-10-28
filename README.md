# dsh-tui

[简体中文](#简体中文) · [English](#english)

---

## 简体中文

`dsh-tui` 是基于 [`feuvan/deepseek-harness`](https://github.com/feuvan/deepseek-harness)
分支构建的预构建终端 TUI，无需安装 Node.js 或 pnpm。

### 安装

```sh
brew tap feuvan/dsh-tui
brew install dsh-tui
```

或使用一条命令：

```sh
brew install feuvan/dsh-tui/dsh-tui
```

Homebrew 7 可能要求先信任第三方 tap：

```sh
brew trust --formula feuvan/dsh-tui/dsh-tui
brew install feuvan/dsh-tui/dsh-tui
```

在任意项目目录运行：

```sh
dsh-tui
```

### 与 Desktop 共存

本 formula 只安装 `dsh-tui`，**不会**安装、替换或遮蔽 Desktop 已有的
`dsh` 命令。它使用共享的 `~/.dsh` home，并创建/使用独立的
`~/.dsh/profiles/tui` profile。

### 支持平台

- macOS arm64 / x86_64
- Linux x86_64 / arm64（基于 glibc 的发行版）

### 版本与更新日志

当前版本：`0.2.2-alpha.2-20261028.2`

完整变更见 [CHANGELOG.md](CHANGELOG.md)。

```sh
brew update
brew upgrade dsh-tui
```

### 来源

- 源码：https://github.com/feuvan/deepseek-harness
- Releases：https://github.com/feuvan/deepseek-harness/releases
- 源码安装 Gist：https://gist.github.com/feuvan/9426596ae9129f147b1d6bf17a4fa167

---

## English

`dsh-tui` is the prebuilt terminal UI from the
[`feuvan/deepseek-harness`](https://github.com/feuvan/deepseek-harness) fork.
It runs the TUI without requiring Node.js or pnpm.

### Install

```sh
brew tap feuvan/dsh-tui
brew install dsh-tui
```

Or in one command:

```sh
brew install feuvan/dsh-tui/dsh-tui
```

Homebrew 7 may require trusting the third-party tap first:

```sh
brew trust --formula feuvan/dsh-tui/dsh-tui
brew install feuvan/dsh-tui/dsh-tui
```

Run it from any project directory:

```sh
dsh-tui
```

### Desktop coexistence

The formula installs only `dsh-tui`. It does **not** install, replace, or
shadow a Desktop-installed `dsh` command. It uses the shared `~/.dsh` home
and its own `~/.dsh/profiles/tui` profile.

### Supported platforms

- macOS arm64 / x86_64
- Linux x86_64 / arm64 (glibc-based distributions)

### Version and changelog

Current version: `0.2.2-alpha.2-20261028.2`

See [CHANGELOG.md](CHANGELOG.md) for the full history.

```sh
brew update
brew upgrade dsh-tui
```

### Source

- Source: https://github.com/feuvan/deepseek-harness
- Releases: https://github.com/feuvan/deepseek-harness/releases
- Source-install Gist: https://gist.github.com/feuvan/9426596ae9129f147b1d6bf17a4fa167
