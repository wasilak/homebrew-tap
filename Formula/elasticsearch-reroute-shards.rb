class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "v1.0.0"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "31aacf29961e360e27cc60424a12b84e237e61f7164b2e403b9d2ebb78ff713e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "233c734a0246c347fb3dd504b52d18a601cb0a710d8dd69bc2a9fb2dc3ebea2c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "ef88c04c394b50fe29b3fd375a8dd2ac278892c65f147ffa4829b98664948c29"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.0/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "2e36d37bb3c92b61c6066c4356c345da3fe89b298217c54869ee755dd65b6194"
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
