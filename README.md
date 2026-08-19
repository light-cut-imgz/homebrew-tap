# LightCutImgz Homebrew Tap

Official Homebrew tap for [**light-cut-imgz**](https://light-cut-imgz.github.io/light-cut-imgz/) — crop, rotate and export your images locally.

## Install

```bash
brew install --cask light-cut-imgz/tap/light-cut-imgz
```

Or use the project's one-line installer, which runs the same `brew install` on macOS and installs
the `.deb` / `.AppImage` on Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/light-cut-imgz/light-cut-imgz/main/install.sh | bash
```

## Upgrade

```bash
brew upgrade --cask light-cut-imgz
```

## Uninstall

```bash
brew uninstall --cask light-cut-imgz
brew untap light-cut-imgz/tap
```

Add `--zap` to also remove settings, caches and application data:

```bash
brew uninstall --zap --cask light-cut-imgz
```

## Requirements

- **macOS 11 Big Sur or later**, Apple Silicon or Intel — the cask picks the right DMG.
- Nothing else to install.

The app is not signed with an Apple Developer certificate. If macOS refuses to open it,
clear the quarantine flag once:

```bash
xattr -dr com.apple.quarantine "/Applications/light-cut-imgz.app"
```

## Contents

| Cask | Description |
|------|-------------|
| [`light-cut-imgz`](Casks/light-cut-imgz.rb) | LightCutImgz desktop app (arm64 + Intel DMG) |

## How this tap is updated

Nothing here is edited by hand. Publishing a release in the
[main repository](https://github.com/light-cut-imgz/light-cut-imgz) triggers its
`update-homebrew-tap` workflow, which recomputes both DMG checksums and bumps
`version` and `sha256` in `Casks/light-cut-imgz.rb`.

The cask body itself is the source of truth and lives only here — the workflow rewrites
those fields and nothing else, so an edit made in this repository is never
overwritten by the next release. Before pushing, the workflow audits and actually
installs the candidate cask on a macOS runner; a cask that fails to install never
reaches this repository.

The workflow needs a `HOMEBREW_TAP_TOKEN` secret on the main repository (a PAT with
`contents: write` here).

## Issues

Report problems on the [main issue tracker](https://github.com/light-cut-imgz/light-cut-imgz/issues).
