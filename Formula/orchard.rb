class Orchard < Formula
  desc "Build and run iOS apps from git worktrees with xcodebuild"
  homepage "https://github.com/kyoya1123/Orchard"
  url "https://github.com/kyoya1123/Orchard/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "9730400fe2540e6f9107f7a73f08638c3b1aa94ce47c2ea0db39015309478546"
  license "MIT"
  head "https://github.com/kyoya1123/Orchard.git", branch: "main"

  depends_on macos: :sonoma
  depends_on xcode: "16.0"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/orchard"
  end

  test do
    assert_match "Build and run iOS apps", shell_output("#{bin}/orchard --help")
    assert_equal version.to_s, shell_output("#{bin}/orchard --version").strip unless version.head?
  end
end
