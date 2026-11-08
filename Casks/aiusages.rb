cask "aiusages" do
  version "0.2.5"
  sha256 "c25c3ae2c74af49c1a5105e2b1abd9685e6171d9d04417d514e81e95e882265e"

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
