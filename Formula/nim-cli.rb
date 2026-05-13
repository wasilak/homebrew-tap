class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.11.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.11.0/nim-darwin-amd64.zip"
      sha256 "05b02f02aa5188324ca02d6d1f861224a8f0b735bdefb492549dbb15683508f1"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.11.0/nim-darwin-arm64.zip"
      sha256 "d3b60fcce7c4995fc04cffe8d62260a37f2e352028b721de8b37212ae30ddceb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.11.0/nim-linux-amd64.zip"
      sha256 "3910617bb0f7091c2c5ce774bc93bc800dc84fcc123caf746abf9696b14b9bde"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.11.0/nim-linux-arm64.zip"
      sha256 "0809fd36bd15a93ad532db0cc61227d54b9fc99ba3a12405de75d8127c8ec8e2"
    end
  end

  conflicts_with "nim", because: "both install a 'nim' binary"

  def install
    bin.install Dir["nim-*"].first => "nim"
    generate_completions_from_executable(bin/"nim", "completion")
  end

  def caveats
    <<~EOS
      If you previously had the Nim language installed, add an alias so your
      shell resolves this binary correctly:

        echo 'alias nim="#{opt_bin}/nim"' >> ~/.zshrc && source ~/.zshrc

      (Replace ~/.zshrc with ~/.bashrc or ~/.config/fish/config.fish as needed.)
    EOS
  end

  test do
    system "#{bin}/nim", "--version"
  end
end
