# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "v1.0.1"

  url "https://github.com/griffin-cli/griffin-cli/releases/download/v1.0.1/griffin-v1.0.1-darwin-x64.tar.xz"
  sha256 "137a93d9fd174d2d296505897648eb7755d936d88b5e33906e20ffa445fa2c36"

  on_macos do
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v1.0.1/griffin-v1.0.1-darwin-arm64.tar.xz"
      sha256 "1f71ea4d08fe9efc07796f5b3597c142a7d44932becc99f4a420f1ec3cd886af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v1.0.1/griffin-v1.0.1-linux-x64.tar.xz"
      sha256 "0ff693c2161ca27d019c5592712485965a9d7e4896931c0a4170cea7f88a6e64"
    end
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v1.0.1/griffin-v1.0.1-linux-arm64.tar.xz"
      sha256 "8e47028a7348aaa98413fb56482e1834ddf504cacffc5c451c14056a021cb5b2"
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
