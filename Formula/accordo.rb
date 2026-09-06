class Accordo < Formula
  desc "Run development services together in terminal tabs or a merged log stream"
  homepage "https://github.com/mattsverse/accordo"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-aarch64-apple-darwin.tar.xz"
      sha256 "bd4a419d4baa2a6b42fe57f0deb9f7031133eb6d3c6c5facc84272c107e15329"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-x86_64-apple-darwin.tar.xz"
      sha256 "7de11cd6ccdb2d2d0986a57cf0505fc98c20a58771df83379fa58538c4f432ae"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dae61fe86b6eb12c6ff916a552218e6d58850b25ada4095510ef2a3876e0725b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7feafab7d2707645981776b52d80f3235316a0ecc30f458f92b9fa5b55397a65"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "accordo"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "accordo"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "accordo"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "accordo"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
