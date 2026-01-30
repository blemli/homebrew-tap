cask "squirreldisk" do
  version "0.3.4"
  sha256 "45820b944d22c6190db622c214800e81496ee8f8b148557015a44e6e0f245b49"

  url "https://github.com/adileo/squirreldisk/releases/download/v#{version}/SquirrelDisk_#{version}_x64.dmg",
    verified: "github.com/adileo/squirreldisk/"
  name "squirreldisk"
  desc "Beautiful, cross-platform, and super fast disk usage analysis tool"
  homepage "https://www.squirreldisk.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  caveats do
    requires_rosetta
  end

  postflight do #disqualifies for core tap
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "/Applications/SquirrelDisk.app"],
      sudo: false
  end

  app "SquirrelDisk.app"

  zap trash: [
    "~/Library/WebKit/com.squirreldisk.dev",
    "~/Library/Caches/com.squirreldisk.dev",
    "~/Library/Saved Application State/com.squirreldisk.dev.savedState",
  ]
end

