class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "0.0.3"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "cc8691e088f2ed68eb3c6692e751dbe00ecde318f393f7efd1b205b3e8a6ef07"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "fadb09604ce0917068b56415aeda4a88662424347c73389f9fb4defa35cc4b1e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "ea4c6b643ba731d82355a2f0bcd31e1283517749597adb89bfc6561e13cd91b4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "42b46bec0a6d097d334767241495880f3fc6a2df5be68e9d6362e6d5b108b02a"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards", "--version"
  end
end
