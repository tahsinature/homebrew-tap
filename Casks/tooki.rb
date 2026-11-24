# Homebrew cask, published in the tahsinature/homebrew-tap repository.
# The release workflow fills in `version` and `sha256` and pushes this file to the tap.
cask "tooki" do
  version "0.18.1"
  sha256 "0afe830e31e33b54f095f4c9e6ce81a8d711a66655b1d03a9604d312b49f4bdd"

  url "https://github.com/tahsinature/tooki/releases/download/v#{version}/Tooki.dmg"
  name "Tooki"
  desc "Keyboard launcher with clipboard history, snippets, emoji, notes and native tools"
  homepage "https://github.com/tahsinature/tooki"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Tooki.app"

  # Tooki is not notarized, so remove the quarantine flag that would block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tooki.app"]
  end

  uninstall quit: "us.tahsin.tooki"
end
