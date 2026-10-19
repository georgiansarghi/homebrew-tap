cask "textpicker" do
  version "0.12.2"
  sha256 "10390e42ce01788ccf2914f86032ce26ffca557f132dc6684169a0c160ab180e"

  url "https://github.com/georgiansarghi/TextPicker/releases/download/v#{version}/TextPicker-arm64.zip"
  name "TextPicker"
  desc "Menu bar app to select part of the screen and copy its text"
  homepage "https://github.com/georgiansarghi/TextPicker"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TextPicker.app"

  uninstall quit: "io.github.georgiansarghi.TextPicker"

  zap trash: [
    "~/Library/Application Support/TextPicker",
    "~/Library/Preferences/io.github.georgiansarghi.TextPicker.plist",
  ]

  caveats <<~EOS
    TextPicker is self-signed and not notarized. On first launch, allow it in
      System Settings → Privacy & Security → Open Anyway
    then grant Screen Recording and Accessibility when asked.
  EOS
end
