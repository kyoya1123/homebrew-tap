class Orchard < Formula
  desc "Build and run iOS apps from git worktrees with xcodebuild"
  homepage "https://github.com/kyoya1123/Orchard"
  url "https://github.com/kyoya1123/Orchard/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0924ea643b997b69e10a60f38d0e51b91e08eee2195fc2db29b89be72ab19539"
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
