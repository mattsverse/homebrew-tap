cask "caffettino" do
  version "0.3.0"
  sha256 "4fcff5a94447014505db2e3ef9ecdb31de4d748b7d022b35f7ad1ccdd17ec233"

  url "https://github.com/mattsverse/caffettino/releases/download/v#{version}/Caffettino-#{version}-universal.dmg"
  name "Caffettino"
  desc "Whimsical menu bar app that keeps your Mac awake"
  homepage "https://github.com/mattsverse/caffettino"

  depends_on macos: ">= :ventura"

  # Caffettino updates itself in place; `brew upgrade` leaves it to that.
  auto_updates true

  app "Caffettino.app"

  uninstall quit: "com.matteogassend.caffettino"
end
