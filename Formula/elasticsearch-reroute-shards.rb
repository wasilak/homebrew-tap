class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "366ebf446545f923bae20c4541d1fac60d18e37ef020330befb973d4474bd24f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "210be38584e9f79af3dd586451a3f649bd3bb4dfb510a2a0e98994d834d35d48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "889a7c1618f5f2388a62888a0624d44a10f0c6774357a739f94af00826abe0d2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "623bbac5cc2c11e1ebe057d36ab52377400e853f952796f310f69799b639bff9"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards", "--version"
  end
end
