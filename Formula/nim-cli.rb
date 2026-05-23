class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.16.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.16.0/nim-darwin-amd64.zip"
      sha256 "940be93775dbebb82f4d958c65fa353d4aa9d2746c7ae5a61596ade96c91152b"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.16.0/nim-darwin-arm64.zip"
      sha256 "7c290a340a5f5fc78f429eec16ece3d038333d261957e9ca428523aba0c1677a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.16.0/nim-linux-amd64.zip"
      sha256 "7615fe1f73c79938214fabc511bae7dd59378e4cbaa4f84e5e4009d87c79b9ca"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.16.0/nim-linux-arm64.zip"
      sha256 "ddc73141287133fc957c5a0c45bfc7b1efa4a4cfce6d06e156acf571917836e4"
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
