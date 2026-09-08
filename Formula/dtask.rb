class Dtask < Formula
  desc "dTask — Apple Silicon system monitor with liquid glass UI"
  homepage "https://github.com/ltnproject/dtask"
  version "1.0.0"
  url "https://github.com/ltnproject/dtask/releases/download/v#{version}/dTask-#{version}.zip"
  sha256 "337ac0dbaf8a39a4f19bb487c515966e92823e92c15871d7f99618e64168241b"

  def install
    prefix.install "dTask.app"
    # Install a launcher script into bin so `dtask` works from terminal
    (bin/"dtask").write <<~SH
      #!/bin/bash
      open "#{prefix}/dTask.app" "$@"
    SH
    # Install a post-install helper that copies to /Applications with sudo
    (libexec/"install-to-applications.sh").write <<~SH
      #!/bin/bash
      set -e
      APP_SRC="#{prefix}/dTask.app"
      APP_DST="/Applications/dTask.app"
      echo "Installing dTask to /Applications..."
      sudo rm -rf "$APP_DST"
      sudo cp -R "$APP_SRC" "$APP_DST"
      sudo xattr -r -d com.apple.quarantine "$APP_DST" 2>/dev/null || true
      echo "✅ dTask installed to /Applications/dTask.app"
      echo "   Launch: open /Applications/dTask.app"
    SH
    chmod "+x", libexec/"install-to-applications.sh"
  end

  def caveats
    <<~EOS
      dTask is installed in Homebrew's Cellar. You can run it with:
        dtask

      To also copy it to /Applications (recommended), run:
        sudo bash #{libexec}/install-to-applications.sh

      This copies dTask.app to /Applications and removes the quarantine attribute.
    EOS
  end

  test do
    assert_predicate prefix/"dTask.app", :directory?
    assert_predicate bin/"dtask", :executable?
  end
end
