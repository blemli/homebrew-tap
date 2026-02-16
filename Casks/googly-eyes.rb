cask "googly-eyes" do
  version "1.1.4"
  sha256 "033ac02dbb4ca309f038f7af01393cd06aa3f40f6e71b85621cbd8ca4c8c4b0f"

  url "https://www.dropbox.com/scl/fi/r1fdhx8r5k08q7fq5apso/Googly-Eyes-#{version}-1764760165.zip?rlkey=w79zg0k1ue6zqbbc51ij3rdaa&raw=1",
    verified: "dropbox.com/"
  name "Googly Eyes"
  desc "Animated eyes in your menu bar that follow your cursor"
  homepage "https://sindresorhus.com/googly-eyes"

  depends_on macos: ">= :sequoia"

  app "Googly Eyes.app"

  zap trash: [
    "~/Library/Application Support/com.sindresorhus.Googly-Eyes",
    "~/Library/Preferences/com.sindresorhus.Googly-Eyes.plist",
  ]
end
