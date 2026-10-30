cask "light-cut-imgz" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "abcb944544f3990d58dfd53ba6de8a4e20413401e1e446da7edc345d41e45b4c",
         intel: "d43fd985c2071624b14842430d9dfaee4235bd64974a3efb641f243c969b030e"

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
