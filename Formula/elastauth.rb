class Elastauth < Formula
  desc "forwardAuth proxy for Kibana providing integration for LDAP"
  homepage "https://github.com/wasilak/elastauth"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/elastauth/releases/download/v1.2.2/elastauth-darwin-amd64.zip"
      sha256 "aca29b15f28e5cd07bc3e3df3fd81e8268c9c8845ecca2924ede7dba9606baaf"
    end
    on_arm do
      url "https://github.com/wasilak/elastauth/releases/download/v1.2.2/elastauth-darwin-arm64.zip"
      sha256 "4aace97150a562e6581fd2ba20916f497bec88cb4263995723b785aa1eb01e08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/elastauth/releases/download/v1.2.2/elastauth-linux-amd64.zip"
      sha256 "2ee295ee3c160ad910f9de5b8244ce37f20f6df4fbb07308606218116a5f3fdd"
    end
    on_arm do
      url "https://github.com/wasilak/elastauth/releases/download/v1.2.2/elastauth-linux-arm64.zip"
      sha256 "c8dbc3199a11e45a4547daa9e97e58362a86d701cbc4bf2fe07ba62e9f6851cb"
    end
  end

  def install
    bin.install "elastauth"
  end

  test do
    system "#{bin}/elastauth", "--version"
  end
end
