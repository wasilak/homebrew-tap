class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "v0.14.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-darwin-amd64.zip"
      sha256 "babfcd1a0a542b3c9a0e3230b4609b5976126be20a2b0e17fd66d1fff02b29da"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-darwin-arm64.zip"
      sha256 "19d2f5f0c5207d034d7792414805447173e9d42515447cf2ddc3e1deaf531899"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-linux-amd64.zip"
      sha256 "d73e6ad7045cc9b91ea07b792165b341f8dc868c201a68518fdc947a75213f31"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-linux-arm64.zip"
      sha256 "f143190a74ba46aae72902ae64a3c2740f385d1bdc1df2479c34ef9098d13451"
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
