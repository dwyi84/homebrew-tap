cask "aiusages" do
  version "0.1.7"
  sha256 "8b663abd6c6e5c7283051b4a37cbcb38809399b5a537e1114807dd4e4fd1aea5"

  url "https://github.com/dwyi84/usages/releases/download/v#{version}/AIUsages-#{version}.zip"
  name "AI Usages"
  desc "Native macOS menu bar app to monitor quotas for OpenCode Go and Google AI Pro"
  homepage "https://github.com/dwyi84/usages"

  livecheck do
    url "https://github.com/dwyi84/usages"
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "AI Usages.app", target: "/Applications/AI Usages.app"

  zap trash: [
    "~/Library/Preferences/com.melissasoft.aiusages.plist",
    "~/Library/Caches/com.melissasoft.aiusages",
  ]

  caveats <<~EOS
    AI Usages is signed with an ad-hoc certificate and is not notarized by Apple,
    so Gatekeeper may block the first launch. Right-click AI Usages.app and choose
    "Open", or run:
      xattr -dr com.apple.quarantine "/Applications/AI Usages.app"
  EOS
end
