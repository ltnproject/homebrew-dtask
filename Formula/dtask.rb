class Dtask < Formula
  desc "dTask — Apple Silicon system monitor with liquid glass UI"
  homepage "https://github.com/ltnproject/dtask"
  version "1.0.0"
  url "https://github.com/ltnproject/dtask/releases/download/v#{version}/dTask-#{version}.zip"
  sha256 "337ac0dbaf8a39a4f19bb487c515966e92823e92c15871d7f99618e64168241b"

  # No dependencies — pure macOS app bundle
  depends_on :macos => :sonoma
  depends_on hardware: :arm

  def install
    # Store the app bundle in Homebrew's Cellar
    prefix.install "dTask.app"

    # Create a `dtask` launcher in PATH
    (bin/"dtask").write <<~SH
      #!/bin/bash
      open "#{prefix}/dTask.app" "$@"
    SH
  end

  def post_install
    # Install to ~/Applications (no sudo required)
    user_apps = File.expand_path("~/Applications")
    FileUtils.mkdir_p(user_apps)
    FileUtils.rm_rf("#{user_apps}/dTask.app")
    FileUtils.cp_r("#{prefix}/dTask.app", "#{user_apps}/dTask.app")

    # Strip quarantine so macOS doesn't block launch
    system "/usr/bin/xattr", "-r", "-d", "com.apple.quarantine",
           "#{user_apps}/dTask.app"
  rescue => e
    opoo "Could not copy to ~/Applications: #{e.message}"
    opoo "Run manually: open #{prefix}/dTask.app"
  end

  def caveats
    user_apps = File.expand_path("~/Applications")
    <<~EOS
      dTask has been installed to:
        #{user_apps}/dTask.app

      Launch it with:
        open ~/Applications/dTask.app
      Or from Terminal:
        dtask

      To also place it in /Applications (system-wide), run:
        sudo cp -R #{prefix}/dTask.app /Applications/dTask.app
        sudo xattr -r -d com.apple.quarantine /Applications/dTask.app
    EOS
  end

  test do
    assert_predicate prefix/"dTask.app", :directory?
    assert_predicate bin/"dtask", :executable?
  end
end
