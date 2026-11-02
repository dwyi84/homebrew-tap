cask "aiusages" do
  version "0.1.8"
  sha256 "49bcf071b2813536d72f645e069079e838462c97063dbe3bc8b790f32bf8d482"

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
