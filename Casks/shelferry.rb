cask "shelferry" do
  version "0.1.0"
  sha256 "6f07e48c7a8e677812203a888cddcafcb1827f4af117cf616072c0a8637cd5ea"

  url "https://github.com/tahsinature/shelferry/releases/download/v#{version}/Shelferry.zip"
  name "Shelferry"
  desc "Native floating file shelves with a CLI and Yazi integration"
  homepage "https://github.com/tahsinature/shelferry"

  depends_on macos: :sonoma

  app "Shelferry.app"
  binary "#{appdir}/Shelferry.app/Contents/Helpers/shelferry"

  uninstall quit: "us.tahsin.shelferry"

  caveats <<~EOS
    Shelferry is currently ad-hoc signed, not Apple-notarized.
    If macOS blocks it, review and allow it in System Settings > Privacy & Security.
    Yazi plugin: ya pkg add tahsinature/shelferry:shelferry
  EOS
end
