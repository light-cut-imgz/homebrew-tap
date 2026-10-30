# homebrew-tap

Homebrew tap for [LightCutImgz](https://github.com/light-cut-imgz/light-cut-imgz).

## Install

```bash
brew install --cask light-cut-imgz/tap/light-cut-imgz
```

## Update

```bash
brew update
brew upgrade --cask light-cut-imgz
```

## Uninstall

```bash
brew uninstall --cask light-cut-imgz
brew untap light-cut-imgz/tap
```

Add `--zap` to `brew uninstall` to also remove the app's settings and caches.

## About unsigned builds

LightCutImgz is not signed or notarized by Apple. If macOS refuses to open it on first launch, remove the quarantine attribute once:

```bash
xattr -dr com.apple.quarantine "/Applications/LightCutImgz.app"
```

## License

MIT — see [LICENSE](LICENSE).
