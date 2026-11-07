cask "caffettino" do
  version "0.2.0"
  sha256 "07a8945ecb2496ec94552513cedb669e36b4d9eb64c515e5d8a005f682789124"

  url "https://github.com/mattsverse/caffettino/releases/download/v#{version}/Caffettino-#{version}-arm64.dmg"
  name "Caffettino"
  desc "Whimsical menu bar app that keeps your Mac awake"
  homepage "https://github.com/mattsverse/caffettino"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  # Caffettino updates itself in place; `brew upgrade` leaves it to that.
  auto_updates true

  app "Caffettino.app"

  uninstall quit: "com.matteogassend.caffettino"
end
