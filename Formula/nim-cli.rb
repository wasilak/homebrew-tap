class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.23.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.23.0/nim-darwin-amd64.zip"
      sha256 "14a30ff21a914e02a5b36f09a80f83439f9c0b83ac6bfea01f27ce7558634375"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.23.0/nim-darwin-arm64.zip"
      sha256 "5fa0cba384fa2d0e90447f776cf37711a936176e686dd03611bb95a001846061"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.23.0/nim-linux-amd64.zip"
      sha256 "297b05cb48e08cf65260db8ac0aee2b0e117e0bd96a3b91fc9c12328cdfa9d2e"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.23.0/nim-linux-arm64.zip"
      sha256 "94e195df0860b24ee8072553a21e7439ebe20090f4210d5840df073a51d05e57"
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
