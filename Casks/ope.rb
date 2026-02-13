cask "ope" do
  version "0.1.0"
  sha256 "0d712e7366590d429d0074139120d3cb811b5e3d7b70af2a93cfaba5efb4e7f9"

  url "https://github.com/blemli/ope/releases/download/v#{version}/Ope_macos.zip",
    verified: "github.com/blemli/ope/"
  name "Ope"
  desc "Open files and folders from your browser via ope:// URLs"
  homepage "https://github.com/blemli/ope"

  livecheck do
    url :url
    strategy :github_latest
  end

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "#{appdir}/Ope.app"],
      sudo: false
  end

  app "Ope.app"

  caveats <<~EOS
    After installation, register the ope:// URL scheme by running:
      #{appdir}/Ope.app/Contents/MacOS/ope install
  EOS

  zap trash: [
    "~/Library/Application Support/ope",
  ]
end
