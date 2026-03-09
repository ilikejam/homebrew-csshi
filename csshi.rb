# frozen_string_literal: true

# Homebrew formula for csshi
class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc 'csshi - ClusterSSH for iTerm2'
  homepage 'https://github.com/ilikejam/csshi'
  url 'https://github.com/ilikejam/csshi/archive/refs/tags/v1.10.tar.gz'
  sha256 '43cba26e77ed3ab83720b4d5705ed49231702a4d3f61bb9e9a82e8b9c0a42536'
  license 'GPL-2.0-only'

  depends_on 'python@3.13'

  @pip_pkgs = [
    'iterm2==2.14',
    'protobuf==7.34.0',
    'websockets==16.0',
    'pyobjc==12.1',
    'pyobjc-core==12.1',
    'pyobjc-framework-Cocoa==12.1'
  ]

  class << self
    attr_reader :pip_pkgs
  end

  def install
    venv = virtualenv_create(libexec, 'python3')
    Csshi.pip_pkgs.each do |pkg|
      venv.pip_install pkg
    end
    rw_info = python_shebang_rewrite_info("#{libexec}/bin/python3")
    rewrite_shebang rw_info, 'csshi'
    bin.install 'csshi'
  end

  test do
    system bin / 'csshi', '--help'
  end
end
