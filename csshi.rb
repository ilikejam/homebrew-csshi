class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "csshi - ClusterSSH for iTerm2"
  homepage "https://github.com/ilikejam/csshi"
  url "https://github.com/ilikejam/csshi/archive/refs/tags/v1.1.tar.gz"
  sha256 "72818b531e54b26d4ae3f4ff1a21b9bab8b65161a5565143edf088373f5428f8"
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
