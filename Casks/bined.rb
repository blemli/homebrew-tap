cask "bined" do
  version "0.2.4"
  sha256 "909b64407ddd6a884d9f6e8e8634be291d7e5ddfe6c94363f1e6ccd3c1f7fb83"
  url "https://bined.exbin.org/download/?f=bined-#{version}.dmg"
  name "bined"
  desc "Free and open source binary/hex viewer/editor"
  homepage "https://bined.exbin.org/"
  livecheck do
    url "https://bined.exbin.org/download/"
    strategy :page_match
    regex(/href=.*?bined-(\d+\.\d+\.\d+)\.dmg/i)
  end
  app "BinEd.app"
  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  # zap trash: "" #todo: add zap trash
  postflight do #avoid quarantine: disqualifies for core tap
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "/Applications/SquirrelDisk.app"],
      sudo: false
  end
end
