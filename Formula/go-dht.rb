class GoDht < Formula
  desc "DHT11/DHT22 Prometheus exporter"
  homepage "https://github.com/wasilak/go-dht"
  version "0.0.10"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/go-dht/archive/refs/tags/v0.0.11.tar.gz"
      sha256 "4e3b820a9118d753fac0d7d334ae2b0c382ef513cd78bb0799fd720aebd5d193"
    end
    on_arm do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.10/go-dht-darwin-arm64.zip"
      sha256 "9ac372d01aa48b7bb07c8859beeae0dbefd883216ffe841b7acf109a5ce41558"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.10/go-dht-linux-amd64.zip"
      sha256 "9388bdab107f93427af68deb8bd52a949485b94064e1ed002a4b4bf78f5dc97c"
    end
    on_arm do
      url "https://github.com/wasilak/go-dht/releases/download/v0.0.10/go-dht-linux-arm64.zip"
      sha256 "36fd1716e30640e60b4b4f62053de2b06bf79e708495e5890ae3e2efddd5d29c"
    end
  end

  def install
    bin.install "go-dht"
  end

  test do
    system "#{bin}/go-dht", "--version"
  end
end
