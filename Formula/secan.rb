class Secan < Formula
  desc "Modern Elasticsearch cluster management tool. Built with Rust and React. Inspired by Cerebro"
  homepage "https://github.com/wasilak/secan"
  version "0.1.11"
  license "AGPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/secan/releases/download/v0.1.11/secan-macos-x86_64"
      sha256 "b454ca45b604f42dcf44d7ae39d90a0bcb468d506387bc1c13e59e387df6b54c"
    end
    on_arm do
      url "https://github.com/wasilak/secan/releases/download/v0.1.11/secan-macos-aarch64"
      sha256 "fdb48f53e5d5572beec275003068dd4369b503860bdfa0bd0c3d736684251c35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/secan/releases/download/v0.1.11/secan-linux-x86_64"
      sha256 "f330f38be41fd1e90aa37bc0735dc31773c0f04705d5c109fcfad33f09eb11d4"
    end
    on_arm do
      url "https://github.com/wasilak/secan/releases/download/v0.1.11/secan-linux-aarch64"
      sha256 "61d86d10290510483c4b3534a196e018509e12bb11f960e5d9ef2628f8dc3688"
    end
  end

  def install
    bin.install stable.url.split("/").last => "secan"
  end

  test do
    system "#{bin}/secan", "--version"
  end
end
