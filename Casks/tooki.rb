# Homebrew cask, published in the tahsinature/homebrew-tap repository.
# The release workflow fills in `version` and `sha256` and pushes this file to the tap.
cask "tooki" do
  version "0.9.8"
  sha256 "3f4a723c7c1f0bb6864897657b487f5eb8770c9588849191a7670e0046054c28"

  url "https://github.com/tahsinature/tooki/releases/download/v#{version}/Tooki.dmg"
  name "Tooki"
  desc "Hyper Key, snippets, clipboard history, menu bar organizer and keep awake"
  homepage "https://github.com/tahsinature/tooki"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  # Tooki updates itself, so Homebrew leaves it alone unless asked with --greedy.
  auto_updates true

  app "Tooki.app"

  # Tooki is not notarized, so remove the quarantine flag that would block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tooki.app"]
  end

  uninstall quit: "us.tahsin.tooki"
end
