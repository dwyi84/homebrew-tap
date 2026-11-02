cask "aiusages" do
  version "0.1.3"
  sha256 "95d9f0db82e344d1a69913c3e0da4d3afc2e8671fe8b916a3f75f2e119c5582b"

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
