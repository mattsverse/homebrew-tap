cask "octowatcher" do
  version "0.6.1"
  sha256 "36860f5b0f08f94961dfa123878228e3c463f689d22cadec1c192ce9fdda9c1d"

  url "https://github.com/mattsverse/octowatch/releases/download/v#{version}/Octowatcher.dmg"
  name "Octowatcher"
  desc "Menu bar notifications for GitHub pull requests waiting on your review"
  homepage "https://github.com/mattsverse/octowatch"

  auto_updates true
  depends_on formula: "gh"
  depends_on :macos

  app "Octowatcher.app"

  zap trash: "~/Library/Application Support/octowatcher"

  caveats <<~EOS
    Sign in to GitHub before opening Octowatcher:
      gh auth login --hostname github.com
  EOS
end
