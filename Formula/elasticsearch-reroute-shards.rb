class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "0.0.2"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "2efa9e3739f31eb2aa4c0d478d8a7bcf5fd361c9699db92b852ae83003bb651d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "f20df28ba999fd51ac66369a151c682629609ab7ac8b7cb484b3f420796fd099"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "99ae378e2ec73b95c3a8cf4b59cb40a0b385c5fc14a505f6a729d20e1b8a564d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.2/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "83647d281e19706199bb95561351431af5cbf07460857c45e8a26f520916063b"
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
