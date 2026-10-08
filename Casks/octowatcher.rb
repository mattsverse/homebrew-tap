cask "octowatcher" do
  version "0.6.0"
  sha256 "14d1f930f0b89de071054b6e4746c5fea9f739b6bba58f216e1662c7ef416f13"

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
