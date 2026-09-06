class Accordo < Formula
  desc "Run development services together in terminal tabs or a merged log stream"
  homepage "https://github.com/mattsverse/accordo"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-aarch64-apple-darwin.tar.xz"
      sha256 "5c3f5c35d82f0fe2325683abd768a35ab3373cfd864e2a5de422dd659272071c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-x86_64-apple-darwin.tar.xz"
      sha256 "b5c045a933fef86e98d581956eeb76143e6b9333cc84318ea96b5d5022ba89e1"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bc29ecd5cdfd898394c49ab527d4d2e09bf447fbb78a2f4d2110d5432ef095c0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mattsverse/accordo/releases/download/v0.1.0/accordo-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d8da0699da24e9d4a468b2760d78ea8c8fbf5fe5b871dd04bc9282bef5b15531"
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
