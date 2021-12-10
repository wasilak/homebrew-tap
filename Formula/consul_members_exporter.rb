class ConsulMembersExporter < Formula
  desc "Consul memebrs exporter"
  homepage "https://github.com/wasilak/consul_members_exporter"
  version "0.0.3"

  if OS.mac?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-darwin-amd64.zip"
    sha256 "1c27f9dcd73c2a19e18aa3c54d76914b68143705aa53c4d4bc19fd83e5215da9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-darwin-arm64.zip"
    sha256 "5b93d1e7b7a709bee18e95e6fa10b10c46102b9de76695d57ac9327a091b8b72"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-amd64.zip"
    sha256 "8bd75a65cc9ca2be696e74b477383e0dbe0d22ae2ab6dbbb55a29af1d03f2a02"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-arm64.zip"
    sha256 "1cc782dd58c04d88779e4af490388596804767ce3d36573f4253ce4f81c16067"
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
