class MacsmcExporter < Formula
  desc "Prometheus exporter for Apple SMC (System Management Controller) metrics"
  homepage "https://github.com/wasilak/macsmc-exporter"
  url "https://github.com/wasilak/macsmc-exporter/releases/download/v0.1.0/macsmc-exporter-macOS-x86_64.tar.gz"
  version "0.1.0"
  sha256 "d518bab8cd139236b5e9e8d8467d3842926a777e84ace5bc67debcbed1b663bf"

  def install
    bin.install "macsmc-exporter"
  end

  test do
    system "#{bin}/macsmc-exporter", "--version"
  end
end
