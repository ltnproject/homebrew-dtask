cask "dtask" do
  version "1.0.0"
  sha256 "337ac0dbaf8a39a4f19bb487c515966e92823e92c15871d7f99618e64168241b"

  url "https://github.com/ltnproject/dtask/releases/download/v#{version}/dTask-#{version}.zip"
  name "dTask"
  desc "Apple Silicon system monitor with cute liquid glass design"
  homepage "https://github.com/ltnproject/dtask"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "dTask-1.0.0/dTask.app"

  zap trash: [
    "~/Library/Preferences/org.dtask.app.plist",
    "~/Library/Saved Application State/org.dtask.app.savedState",
  ]
end
