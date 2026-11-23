class Orchard < Formula
  desc "Build and run iOS apps from git worktrees with xcodebuild"
  homepage "https://github.com/kyoya1123/Orchard"
  url "https://github.com/kyoya1123/Orchard/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "16d7a516fe6d85a4d3f3f8087959f1c950da3c059189ee1dbf1dc981865362d1"
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
