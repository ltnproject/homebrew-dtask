class Dtask < Formula
  desc "dTask — Apple Silicon system monitor with liquid glass UI"
  homepage "https://github.com/ltnproject/dtask"
  version "1.0.0"
  url "https://github.com/ltnproject/dtask/releases/download/v#{version}/dTask-#{version}.zip"
  sha256 "337ac0dbaf8a39a4f19bb487c515966e92823e92c15871d7f99618e64168241b"

  def install
    prefix.install "dTask.app"
  end

  def post_install
    system "/bin/rm", "-rf", "/Applications/dTask.app"
    system "/bin/cp", "-R", "#{prefix}/dTask.app", "/Applications/dTask.app"
    system "/usr/bin/xattr", "-r", "-d", "com.apple.quarantine", "/Applications/dTask.app"
  rescue StandardError
    # quarantine removal is best-effort
  end

  def caveats
    <<~EOS
      dTask has been installed to:
        /Applications/dTask.app

      The macOS quarantine attribute has been automatically removed.
      Launch with:
        open /Applications/dTask.app

      Requires Apple Silicon (M1+) and macOS 14 Sonoma or later.
    EOS
  end

  test do
    assert_predicate prefix/"dTask.app", :directory?
  end
end
