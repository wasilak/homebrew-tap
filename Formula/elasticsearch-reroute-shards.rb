class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "1.0.0"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/archive/refs/tags/v1.0.1.tar.gz"
    sha256 "fac8ef4d8661b53b7d995637950f68abc6e847acd95ef723cce8824582896218"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "e371a1bba33eaf369ce379f336732f5f7bdce5f3df51234afb03c1975f52a082"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "39c2a6f5ac7eeb4f1102f53ae877ec2d6d9977b1c122b9512dac4b56bc235846"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "18a00e9ab8a58a999fcfcc4ef121af6c23f6c07f489005c350c3016d94c4e328"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards", "--version"
  end
end
