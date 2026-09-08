class Dtask < Formula
  desc "Apple Silicon system monitor with liquid glass UI"
  homepage "https://github.com/ltnproject/dtask"
  version "1.0.0"
  url "https://github.com/ltnproject/dtask/releases/download/v#{version}/dTask-#{version}.zip"
  sha256 "337ac0dbaf8a39a4f19bb487c515966e92823e92c15871d7f99618e64168241b"

  def install
    prefix.install "dTask.app"
    (bin/"dtask").write <<~SH
      #!/bin/bash
      open "/Applications/dTask.app" "$@"
    SH
  end

  post_install_steps do
    run "/bin/rm",
        args: ["-rf", "/Applications/dTask.app"],
        sudo: :if_needed,
        must_succeed: false
    run "/bin/cp",
        args: ["-R", "{{prefix}}/dTask.app", "/Applications/dTask.app"],
        sudo: :if_needed
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "/Applications/dTask.app"],
        sudo: :if_needed,
        must_succeed: false
  end

  def caveats
    <<~EOS
      dTask has been installed to:
        /Applications/dTask.app

      The macOS quarantine attribute has been automatically removed.
      Launch with:
        open /Applications/dTask.app
      Or from Terminal:
        dtask
    EOS
  end

  test do
    assert_predicate prefix/"dTask.app", :directory?
    assert_predicate bin/"dtask", :executable?
  end
end
