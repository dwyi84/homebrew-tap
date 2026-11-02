cask "aiusages" do
  version "0.1.0"
  sha256 "1b2fc3ce0ad8485bf453e784e1f58c4346dad5852233005d09a70d6301d2eec2"

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
  depends_on macos: ">= :ventura"

  app "AI Usages.app", target: "/Applications/AI Usages.app"

  zap trash: [
    "~/Library/Preferences/com.melissasoft.aiusages.plist",
    "~/Library/Caches/com.melissasoft.aiusages",
  ]
end
