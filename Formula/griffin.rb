# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "v0.2.0"

  url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.2.0/griffin-v0.2.0-darwin-x64.tar.xz"
  sha256 "0dc73b321f528c1533c0eebc32c7ef86742f8ba7dfc36a0a476a3a5bff5e482d"

  on_macos do
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.2.0/griffin-v0.2.0-darwin-arm64.tar.xz"
      sha256 "3bd09a646f1c5d3080f1c0d9d851346b7db925d6bb68110c6299897391ffe2a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.2.0/griffin-v0.2.0-linux-x64.tar.xz"
      sha256 "3f5c72dbcc818fd9719220b53cf133cf02541ef4b4e98226514352fb9f7ac3a4"
    end
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.2.0/griffin-v0.2.0-linux-arm64.tar.xz"
      sha256 "864ee2b493b8ff846ff9708d0be49ed29aaf1062e5e899d64f21a65b9ce70545"
    end
  end

  def install
    inreplace "bin/griffin", /^CLIENT_HOME=/, "export GRIFFIN_OCLIF_CLIENT_HOME=#{libexec/"dist"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/griffin"
  end

  def caveats; <<~EOS
    Enable autocomplete for zsh by running

      $ griffin autocomplete zsh

    If you're using bash, run

      $ griffin autocomplete bash
  EOS
  end

  test do
    system bin/"griffin", "version"
  end
end
