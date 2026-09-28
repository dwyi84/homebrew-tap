cask "nightowl" do
  version "0.6.1"
  sha256 "eeeddb6b1a609cddba0853621f23ff673884ce583822d21478c862d798f6afa9"

  url "https://github.com/dwyi84/NightOwl/releases/download/v#{version}/NightOwl-#{version}.zip"
  name "NightOwl"
  desc "Menu bar utility that prevents idle sleep"
  homepage "https://github.com/dwyi84/NightOwl"

  livecheck do
    url "https://github.com/dwyi84/NightOwl"
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NightOwl.app", target: "~/Applications/NightOwl.app"

  zap trash: [
    "~/Library/Preferences/com.nightowl.NightOwl.plist",
    "~/Library/Saved Application State/com.nightowl.NightOwl.savedState",
  ]

  caveats <<~EOS
    NightOwl is signed with a local certificate and is not notarized by Apple,
    so Gatekeeper blocks the first launch. Right-click NightOwl.app and choose
    "Open", or run:
      xattr -dr com.apple.quarantine "#{Dir.home}/Applications/NightOwl.app"
  EOS
end
