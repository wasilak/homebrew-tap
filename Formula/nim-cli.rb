class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.19.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.19.0/nim-darwin-amd64.zip"
      sha256 "733a4f0d86bb660743912b10711265ac01a3396d606314df7f98be3c7d99981d"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.19.0/nim-darwin-arm64.zip"
      sha256 "3a8ee7cfde14534b086ae110a57c5aa801bf1fb5d8ef2cc18ae606133677f004"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.19.0/nim-linux-amd64.zip"
      sha256 "170b351192268b72736af45b64c51ad38574f68c49ae150390c1c64584ca45df"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.19.0/nim-linux-arm64.zip"
      sha256 "fee6bb1028dde9dbca1e20aec53d8fad781cf00da4907a4912e1ddb95d6d4a78"
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
