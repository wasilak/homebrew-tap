class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "19a83b1a3b19b947bfcd9699fa66975a30e5237457a64af7e0b63c9e220f2d0a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "6c2886cc64003397eb7231d5c26749dddab03a11de58fd64479d6231965b691c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "a2fdad85e2f5399ad47240a2d2b0392979daf072332a37cc5e2acd9b437d9bf5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "18a8ad114016ee4f252cbd1b4ed09f4012b36a8464e7249e1d0bbf7a95411ffb"
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
