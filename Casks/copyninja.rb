cask "copyninja" do
  version "0.3.2"
  sha256 "68155121a4c64f33fb24e2ef1a126793607d50b42e50dc0b87699b2a0d1c7819"

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
