cask "light-cut-imgz" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.2"
  sha256 arm:   "6836bc8ef7009264445d62292ca4e7bc9f0a8596a01ec78e1934b00640bdecf6",
         intel: "597eb054bb2bffcfb7b4dd7ddd89536f733d7f4f413bd7ffec92eaba4126f9fb"

  url "https://github.com/light-cut-imgz/light-cut-imgz/releases/download/v#{version}/LightCutImgz_#{arch}.app.tar.gz"
  name "LightCutImgz"
  desc "Native image editor to crop, rotate and export locally"
  homepage "https://github.com/light-cut-imgz/light-cut-imgz"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "LightCutImgz.app"

  zap trash: [
    "~/Library/Application Support/com.sikander.light-cut-imgz",
    "~/Library/Caches/com.sikander.light-cut-imgz",
    "~/Library/Preferences/com.sikander.light-cut-imgz.plist",
    "~/Library/Saved Application State/com.sikander.light-cut-imgz.savedState",
    "~/Library/WebKit/com.sikander.light-cut-imgz",
  ]

  caveats <<~EOS
    LightCutImgz is not signed or notarized by Apple. On first launch macOS may
    refuse to open it. Remove the quarantine attribute once:

      xattr -dr com.apple.quarantine "/Applications/LightCutImgz.app"
  EOS
end
