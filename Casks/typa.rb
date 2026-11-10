# Homebrew cask, published in the tahsinature/homebrew-tap repository.
# The release workflow fills in `version` and `sha256` and pushes this file to the tap.
cask "typa" do
  version "0.1.9"
  sha256 "69cd968f8b1426852b0dfd2c07d7590d0446791245f7d8fd22d24b27b96e50f0"

  url "https://github.com/tahsinature/typa/releases/download/v#{version}/Typa_#{version}_universal.dmg"
  name "Typa"
  desc "Desktop scratchpad for math, text and everyday developer tools"
  homepage "https://github.com/tahsinature/typa"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Typa updates itself, so Homebrew leaves it alone unless asked with --greedy.
  auto_updates true

  app "Typa.app"

  # Typa is not notarized, so remove the quarantine flag that would block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Typa.app"]
  end

  uninstall quit: "us.tahsin.typa"
end
