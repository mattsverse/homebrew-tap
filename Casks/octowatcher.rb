cask "octowatcher" do
  version "0.7.0"
  sha256 "b9dc3df506e75d244de4e6ffd7716d5194cea268a4c8d734e979ad0bb7a640ef"

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
