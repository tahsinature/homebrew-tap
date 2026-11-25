cask "shelferry" do
  version "0.4.4"
  sha256 "3416f2204358181f968d61220952a73693517509454d6fb3a4e3988b73ac05fb"

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
