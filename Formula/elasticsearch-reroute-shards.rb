class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool (based on size, not number of them per node)"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "a91a90e43ae7e527cfb36a86e0484e979bc72a384fa1e7814eca8b235b15c654"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "f20df28ba999fd51ac66369a151c682629609ab7ac8b7cb484b3f420796fd099"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "97e16d3209968c91c431521168805808c49c165060decb664366a01f7cb045f2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "5f6e891c458532a81168ca01caaeed88f57cc12d5a47396e26ce3aa443d8d491"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards --version"
  end
end
