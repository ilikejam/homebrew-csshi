class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "csshi - ClusterSSH for iTerm2"
  homepage "https://github.com/ilikejam/csshi"
  url "https://github.com/ilikejam/csshi/archive/refs/tags/v1.2.tar.gz"
  sha256 "ddc3054a1fbbbc58a78acd1ba49b41932b6207755f88d3b820cb77a722cb45a8"
  license "GPL-2.0-only"

  depends_on "python@3.12"

  @@pip_pkgs = [
    "iterm2==2.7",
    "protobuf==4.25.1",
    "websockets==10.4",
    "pyobjc==9.2",
    "pyobjc-core==9.2",
    "pyobjc-framework-Cocoa==9.2",
  ]

  def install
    venv = virtualenv_create(libexec, "python3")
    @@pip_pkgs.each do |pkg|
      venv.pip_install pkg
    end
    bin.install "csshi"
    rw_info = python_shebang_rewrite_info("#{libexec}/bin/python3")
    rewrite_shebang rw_info, bin/"csshi"
  end

  test do
    system bin/"csshi", "--help"
  end
end
