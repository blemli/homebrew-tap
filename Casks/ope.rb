cask "ope" do
  version "0.3.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
