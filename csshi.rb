# frozen_string_literal: true

# Homebrew formula for csshi
class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc 'csshi - ClusterSSH for iTerm2'
  homepage 'https://github.com/ilikejam/csshi'
  url 'https://github.com/ilikejam/csshi/archive/refs/tags/v1.7.tar.gz'
  sha256 '65994b6242d41b910f71214b41b279307e4390fe03594b5a45b128cc7fb95ca9'
  license 'GPL-2.0-only'

  depends_on 'python@3.13'

  @pip_pkgs = [
    'iterm2==2.9',
    'protobuf==6.30.2',
    'websockets==15.0.1',
    'pyobjc==11.0',
    'pyobjc-core==11.0',
    'pyobjc-framework-Cocoa==11.0'
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
