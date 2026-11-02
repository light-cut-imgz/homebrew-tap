cask "light-cut-imgz" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "dd9a6ecf4c36509d20fe9aaabd2f640c9c9153bd54471622c728eb358aa400c3",
         intel: "2d68a0c872076e4da4488f7f550ff0a4e952fc9dcf48b4104d9f1eac5143f8d6"

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
