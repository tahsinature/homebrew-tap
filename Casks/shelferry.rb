cask "shelferry" do
  version "0.1.2"
  sha256 "2d85c74b5f9bd2e94a85be96434317c93c85c5a2b6c6be3f04750e7c3681b398"

  url "https://github.com/tahsinature/shelferry/releases/download/v#{version}/Shelferry.zip"
  name "Shelferry"
  desc "Native floating file shelves with a CLI and Yazi integration"
  homepage "https://github.com/tahsinature/shelferry"

  depends_on macos: :sonoma

  app "Shelferry.app"
  binary "#{appdir}/Shelferry.app/Contents/Helpers/shelferry"

  uninstall quit: "us.tahsin.shelferry"

  caveats <<~EOS
    Shelferry is not Apple-notarized.
    If macOS blocks it, review and allow it in System Settings > Privacy & Security.
    Yazi plugin: ya pkg add tahsinature/shelferry:shelferry
  EOS
end
