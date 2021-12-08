class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "0.0.3"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "727d085025b755f2c5dfc58d6de5e50894960a0fcd5b819b0eb18f4e80646af2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "fadb09604ce0917068b56415aeda4a88662424347c73389f9fb4defa35cc4b1e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "d69760239ddf77d43cb252eeef2308e3576a0c9029f2cf0e146ba75056dbe210"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "8b036f00e7bc249a0f02615088b5c74d9cd8fb6e95f4dbd45f23643856c98738"
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
