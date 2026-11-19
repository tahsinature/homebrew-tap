# Homebrew cask, published in the tahsinature/homebrew-tap repository.
# The release workflow fills in `version` and `sha256` and pushes this file to the tap.
cask "tooki" do
  version "0.16.0"
  sha256 "7835898d222ba5d10d92d3a3c1b680c97aa17c0becb15edd0b4736d1747739f6"

  url "https://github.com/tahsinature/tooki/releases/download/v#{version}/Tooki.dmg"
  name "Tooki"
  desc "Keyboard launcher with clipboard history, snippets, emoji, notes and native tools"
  homepage "https://github.com/tahsinature/tooki"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Tooki.app"

  # Tooki is not notarized, so remove the quarantine flag that would block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tooki.app"]
  end

  uninstall quit: "us.tahsin.tooki"
end
