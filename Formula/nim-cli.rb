class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.20.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.20.0/nim-darwin-amd64.zip"
      sha256 "dad9bac537c20b340ac9b8ab6d9d36654d5b0f5ffe88e056631a7ec0e7dba83e"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.20.0/nim-darwin-arm64.zip"
      sha256 "8b4513b7342aa2743b2a7786fca5148830d6cc868379b729dbee3fe5ee7e5835"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.20.0/nim-linux-amd64.zip"
      sha256 "fe61b6694f78fe15a3479be41ccaaf204b72386e6904f4d6778c3ef02a1406a9"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.20.0/nim-linux-arm64.zip"
      sha256 "90e6b3577fae6182a7c583a3928c2284bf5e38266c91ae8da10d1507adbd3371"
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
