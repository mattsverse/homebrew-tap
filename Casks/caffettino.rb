cask "caffettino" do
  version "0.1.0"
  sha256 "0dced94b9cb456aa7cfde76ac3bd0a2bae8c5ea1f08b72e953dfbc442d51b378"

  url "https://github.com/mattsverse/caffettino/releases/download/v#{version}/Caffettino-#{version}-arm64.dmg"
  name "Caffettino"
  desc "Whimsical menu bar app that keeps your Mac awake"
  homepage "https://github.com/mattsverse/caffettino"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Caffettino.app"

  uninstall quit: "com.matteogassend.caffettino"
end
