class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.21.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.21.0/nim-darwin-amd64.zip"
      sha256 "f7fb1e165463d14f8369175490c90ed9871bd786a0ac6c00a88b01db549e23ce"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.21.0/nim-darwin-arm64.zip"
      sha256 "ad1b7a77c8998acdbbd47bbcf0625c6d83fee77972db0e43ca57aad03bc64175"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.21.0/nim-linux-amd64.zip"
      sha256 "439aafffbea31184892f30a7b608680628d28caf892937f58b93ed72bd375c49"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.21.0/nim-linux-arm64.zip"
      sha256 "4cbd2b5debd7526e048e20f2a6d7762e698f3a8b6cce03e94068cb06eac8823a"
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
