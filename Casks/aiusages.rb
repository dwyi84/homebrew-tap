cask "aiusages" do
  version "0.2.6"
  sha256 "29f8384ac67dd4d1899c4d459fed5e85c484b4f10953d3c193093896a945bad7"

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
