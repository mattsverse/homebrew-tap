cask "caffettino" do
  version "0.4.0"
  sha256 "a2c2fdd72cef82d2a6540ed47779d5ee93fdd913f85bdb9e3f0dcea7983029c4"

  url "https://github.com/mattsverse/caffettino/releases/download/v#{version}/Caffettino-#{version}-universal.dmg"
  name "Caffettino"
  desc "Whimsical menu bar app that keeps your Mac awake"
  homepage "https://github.com/mattsverse/caffettino"

  depends_on macos: ">= :ventura"

  # Caffettino updates itself in place; `brew upgrade` leaves it to that.
  auto_updates true

  app "Caffettino.app"
  binary "#{appdir}/Caffettino.app/Contents/MacOS/caffettino"

  uninstall quit: "com.matteogassend.caffettino"
end
