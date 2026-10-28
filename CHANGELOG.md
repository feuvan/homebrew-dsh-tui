# Changelog

[简体中文](#简体中文) · [English](#english)

---

## 简体中文

## 简体中文

### 0.2.2-alpha.2-20261028.3 · 2026-10-28

- 新增 `/account`：显示账号身份、充值余额、赠送余额、用量与充值链接。
- 支持刷新、重新登录和带确认的退出登录。
- 账号资料与余额查询独立降级，并提供原地重试。
- 账号查询增加 15 秒超时和可操作错误文案。
- 账号 dock 显示浏览器登录等待状态，Esc 可取消登录。
- 完善账号中英文文案。
- 基于功能分支提交 `52a07954` 重新构建预构建归档。

### 0.2.2-alpha.2-20261028.2 · 2026-10-28
 · 2026-10-28

- 增加终端首次启动设置：可用 DeepSeek 账号登录、API Key，或暂时跳过。
- 账号登录通过系统浏览器完成，并仅在登录期间启动 loopback OAuth 回调。
- API Key 经掩码输入并写入受管理凭据库，不写入 profile patch。
- 登录后自动选择 DeepSeek 账号或官方 API 模型路由，并将其保存为默认模型。
- 新增 `/login`，可在之后重新打开设置；已有可用模型路由时不会显示设置。
- 基于功能分支提交 `0aaf55e2` 重新构建预构建归档。

### 0.2.2-alpha.2-20261028 · 2026-10-28

- 同步上游 `deepseek-harness` master 至 `f3803c96`（`0.2.2-alpha.2`）。
- 基于功能分支 `feat/tui-interaction-upgrade` 的合并提交
  `56328446` 重新构建预构建归档。
- 更新 macOS arm64/x86_64、Linux x86_64/arm64 预构建归档及 SHA256。
- 保持 `dsh-tui` 命令名；不安装或覆盖 Desktop 的 `dsh` 命令。
- 继续使用共享 `~/.dsh` home 和独立的 `~/.dsh/profiles/tui` profile。

### 0.2.1-rc.3 · 2026-10-27

- 首次发布预构建 `dsh-tui`。
- 基于功能分支提交 `9c6ac6b8` 构建。
- 提供 macOS arm64/x86_64、Linux x86_64/arm64 归档和一键安装脚本。

---

## English

## English

### 0.2.2-alpha.2-20261028.3 · 2026-10-28

- Added `/account`: signed-in identity, recharge and bonus wallets, usage and
  top-up links.
- Supports refresh, re-login, and confirmed sign-out.
- Profile and wallet failures degrade independently with in-place retry.
- Account queries now have a 15-second deadline and actionable error copy.
- The account dock shows browser sign-in progress and Esc cancellation.
- Completed English and Chinese account copy.
- Rebuilt the prebuilt archives from feature commit `52a07954`.

### 0.2.2-alpha.2-20261028.2 · 2026-10-28
 · 2026-10-28

- Added first-run terminal setup: sign in with a DeepSeek account, use an API
  key, or skip for now.
- Account sign-in completes in the system browser and starts a loopback OAuth
  callback only for the duration of the attempt.
- API keys use masked input and the managed credential store, not the profile
  patch.
- After sign-in the terminal selects the DeepSeek account or official API
  model route and persists it as the default.
- Added `/login` to reopen setup later; setup is skipped when a model route is
  already usable.
- Rebuilt the prebuilt archives from feature commit `0aaf55e2`.

### 0.2.2-alpha.2-20261028 · 2026-10-28


- Synced upstream `deepseek-harness` master to `f3803c96`
  (`0.2.2-alpha.2`).
- Rebuilt the prebuilt archives from the feature-branch merge commit
  `56328446` on `feat/tui-interaction-upgrade`.
- Updated the macOS arm64/x86_64 and Linux x86_64/arm64 archives and their
  SHA256 digests.
- Kept the `dsh-tui` command name; the Desktop `dsh` command is neither
  installed nor replaced.
- Continues to use the shared `~/.dsh` home and its own
  `~/.dsh/profiles/tui` profile.

### 0.2.1-rc.3 · 2026-10-27

- First prebuilt `dsh-tui` release.
- Built from feature-branch commit `9c6ac6b8`.
- Included macOS arm64/x86_64 and Linux x86_64/arm64 archives plus a
  one-line installer.
