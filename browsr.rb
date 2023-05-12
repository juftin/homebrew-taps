# typed: true
# frozen_string_literal: true

require "language/python"

# 🗂️ a pleasant file explorer in your terminal
#
# This formula installs the Browsr python package, which is a TUI
# file explorer for your terminal. It's a great way to navigate
# your file system and perform basic file operations.
#
class Browsr < Formula
  include Language::Python::Virtualenv

  desc "Python package for browser automation"
  homepage "https://github.com/juftin/browsr"
  url "https://github.com/juftin/browsr/archive/v1.2.2.tar.gz"
  sha256 "926e89031b09ab1e4c4bff82ffffcd700266707c9e8643f6dfa0a42d2b4c22a9"
  license "MIT"

  depends_on "python"

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", ".[all]"
    bin.install_symlink libexec/"bin/browsr"
  end

  test do
    system "#{bin}/browsr", "--version"
  end
end
