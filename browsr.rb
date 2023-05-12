# typed: true
# frozen_string_literal: true

# 🗂️ a pleasant file explorer in your terminal
#
# This formula installs the Browsr python package, which is a TUI
# file explorer for your terminal. It's a great way to navigate
# your file system and perform basic file operations.
#
class Browsr < Formula
  include Language::Python::Virtualenv

  desc "🗂️ a pleasant file explorer in your terminal"
  homepage "https://github.com/juftin/browsr"
  url "https://github.com/juftin/browsr/archive/v1.2.2.tar.gz"
  license "MIT"

  depends_on "python@3.10"

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", ".[all]"
    bin.install_symlink libexec/"bin/browsr"
  end

  test do
    system "#{bin}/browsr", "--version"
  end
end
