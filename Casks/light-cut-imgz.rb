cask "light-cut-imgz" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "ccf3c979ca052db1140ad5cd0a43140efcfb2127685601301ae8bea0a34e6bb5",
         intel: "e9aa76bc0ffbc21f02b487fd5e91b7c547f16f4a8916770415d337b01848bdf6"

  url "https://github.com/light-cut-imgz/light-cut-imgz/releases/download/v#{version}/light-cut-imgz_#{arch}.app.tar.gz",
      verified: "github.com/light-cut-imgz/light-cut-imgz/"
  name "LightCutImgz"
  desc "Native image editor to crop, rotate and export locally"
  homepage "https://light-cut-imgz.github.io/light-cut-imgz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "light-cut-imgz.app"

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

      xattr -dr com.apple.quarantine "/Applications/light-cut-imgz.app"
  EOS
end
