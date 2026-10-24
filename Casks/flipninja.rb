cask "flipninja" do
  version "0.0.1"
  sha256 "5dd54755bdc4cb17bc5fc1f1b58b6900d2ad3a87d1086ea2d39dea4614de90a0"

  url "https://github.com/dwyi84/FlipNinja/releases/download/v#{version}/FlipNinja-#{version}.zip"
  name "FlipNinja"
  desc "Menu bar utility that flips the display to portrait and rotates trackpad scrolling to match"
  homepage "https://github.com/dwyi84/FlipNinja"

  livecheck do
    url "https://github.com/dwyi84/FlipNinja"
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FlipNinja.app", target: "~/Applications/FlipNinja.app"

  zap trash: [
    "~/Library/Application Support/FlipNinja",
    "~/Library/Preferences/com.melissasoft.FlipNinja.plist",
    "~/Library/Saved Application State/com.melissasoft.FlipNinja.savedState",
  ]

  caveats <<~EOS
    FlipNinja is signed with a local certificate and is not notarized by Apple,
    so Gatekeeper blocks the first launch. Right-click FlipNinja.app and choose
    "Open", or run:
      xattr -dr com.apple.quarantine "#{Dir.home}/Applications/FlipNinja.app"
  EOS
end
