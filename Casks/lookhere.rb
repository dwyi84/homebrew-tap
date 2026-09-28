cask "lookhere" do
  version "1.6.8"
  sha256 "db624a3f35621a10863024c313723267a761bc9cb17bdfff5c54b18e049645f1"

  url "https://github.com/dwyi84/LookHere/releases/download/v#{version}/LookHere-v#{version}-macos-arm64.zip"
  name "LookHere"
  desc "Menu bar utility that draws a halo ring around the mouse cursor"
  homepage "https://github.com/dwyi84/LookHere"

  livecheck do
    url "https://github.com/dwyi84/LookHere"
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "LookHere.app", target: "~/Applications/LookHere.app"

  zap trash: [
    "~/Library/Preferences/com.lookhere.LookHere.plist",
    "~/Library/Saved Application State/com.lookhere.LookHere.savedState",
  ]

  caveats <<~EOS
    LookHere is signed with a local certificate and is not notarized by Apple,
    so Gatekeeper blocks the first launch. Right-click LookHere.app and choose
    "Open", or run:
      xattr -dr com.apple.quarantine "#{Dir.home}/Applications/LookHere.app"
  EOS
end
