cask "copyninja" do
  version "0.3.1"
  sha256 "e36ba1d53d90ce0a9259523b2975c4f95b04cabd9c156731c1ff10c9e2495f37"

  url "https://github.com/dwyi84/CopyNinja/releases/download/v#{version}/CopyNinja-#{version}.zip"
  name "CopyNinja"
  desc "Menu bar clipboard manager with search, quick slots, and image OCR"
  homepage "https://github.com/dwyi84/CopyNinja"

  livecheck do
    url "https://github.com/dwyi84/CopyNinja"
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "CopyNinja.app", target: "~/Applications/CopyNinja.app"

  zap trash: [
    "~/Library/Application Support/CopyNinja",
    "~/Library/Preferences/com.melissasoft.CopyNinja.plist",
    "~/Library/Saved Application State/com.melissasoft.CopyNinja.savedState",
  ]

  caveats <<~EOS
    CopyNinja is signed ad-hoc and is not notarized by Apple, so Gatekeeper
    blocks the first launch. Right-click CopyNinja.app and choose "Open", or run:
      xattr -dr com.apple.quarantine "#{Dir.home}/Applications/CopyNinja.app"
  EOS
end
