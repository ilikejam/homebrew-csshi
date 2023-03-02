class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "csshi - ClusterSSH for iTerm2"
  homepage "https://github.com/ilikejam/csshi"
  url "https://github.com/ilikejam/csshi/archive/refs/tags/v1.0.tar.gz"
  sha256 "e8d038e56d27fe0b301186a2ed7424bdfbec3cb6c51682d04e15c53c7c035766"
  license "GPL-2.0-only"

  depends_on "python@3.11"

  @@pip_pkgs = [
    "iterm2==2.7",
    "protobuf==4.22.0",
    "websockets==10.4",
    "pyobjc==9.0.1",
    "pyobjc-core==9.0.1",
    "pyobjc-framework-Cocoa==9.0.1",
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
