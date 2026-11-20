cask "shelferry" do
  version "0.3.0"
  sha256 "0cf700e19c12a7c91f8a10b1a7757b0ccd5257597d5e9be5622497daef8d618d"

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
