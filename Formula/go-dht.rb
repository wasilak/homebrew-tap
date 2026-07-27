class GoDht < Formula
  desc "DHT11/DHT22 Prometheus exporter"
  homepage "https://github.com/wasilak/go-dht"
  version "0.0.11"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/go-dht/archive/refs/tags/v0.0.11.tar.gz"
      sha256 "4e3b820a9118d753fac0d7d334ae2b0c382ef513cd78bb0799fd720aebd5d193"
    end
    on_arm do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.11/go-dht-darwin-arm64.zip"
      sha256 "52b9fa5d2b4c7ceb7287c72666794ecb6bcdc00b7f865f36c3e6d90fbe5dbbff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.11/go-dht-linux-amd64.zip"
      sha256 "64c37878c8be00b2a3a850be1c734b3770a6a6cefc8af11d827dfb14e14b100c"
    end
    on_arm do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.11/go-dht-linux-arm64.zip"
      sha256 "e73a5b5f915d9d26b7033f145df57b2c316c16033b6bd75e6c98fb6565de3145"
    end
  end

  def install
    bin.install "go-dht"
  end

  test do
    system "#{bin}/go-dht", "--version"
  end
end
