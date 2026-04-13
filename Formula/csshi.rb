# frozen_string_literal: true

# Homebrew formula for csshi
class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc 'csshi - ClusterSSH for iTerm2'
  homepage 'https://github.com/ilikejam/csshi'
  url 'https://github.com/ilikejam/csshi/archive/refs/tags/v1.13.tar.gz'
  sha256 'e33b5fcdaf00d528ac2971065733a4b07bcc7853fd7d0ebf70ea3c982482998b'
  license 'GPL-2.0-only'

  depends_on 'python@3.14'

  resource 'iterm2' do
    url 'https://files.pythonhosted.org/packages/70/9e/ba83b3feb6a6f226b52b665e94149b53e6e2fb7ac91ee7ff4acc7d47d825/iterm2-2.14.tar.gz'
    sha256 'b88bd369520a50955c034c2666d7a5d647c2a3a33003c06f4be8013acbaa2d71'
  end

  resource 'protobuf' do
    url 'https://files.pythonhosted.org/packages/f2/00/04a2ab36b70a52d0356852979e08b44edde0435f2115dc66e25f2100f3ab/protobuf-7.34.0.tar.gz'
    sha256 '3871a3df67c710aaf7bb8d214cc997342e63ceebd940c8c7fc65c9b3d697591a'
  end

  resource 'pyobjc' do
    url 'https://files.pythonhosted.org/packages/17/06/d77639ba166cc09aed2d32ae204811b47bc5d40e035cdc9bff7fff72ec5f/pyobjc-12.1.tar.gz'
    sha256 '686d6db3eb3182fac9846b8ce3eedf4c7d2680b21b8b8d6e6df054a17e92a12d'
  end

  resource 'pyobjc-core' do
    url 'https://files.pythonhosted.org/packages/b8/b6/d5612eb40be4fd5ef88c259339e6313f46ba67577a95d86c3470b951fce0/pyobjc_core-12.1.tar.gz'
    sha256 '2bb3903f5387f72422145e1466b3ac3f7f0ef2e9960afa9bcd8961c5cbf8bd21'
  end

  resource 'pyobjc-framework-cocoa' do
    url 'https://files.pythonhosted.org/packages/02/a3/16ca9a15e77c061a9250afbae2eae26f2e1579eb8ca9462ae2d2c71e1169/pyobjc_framework_cocoa-12.1.tar.gz'
    sha256 '5556c87db95711b985d5efdaaf01c917ddd41d148b1e52a0c66b1a2e2c5c1640'
  end

  resource 'websockets' do
    url 'https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4/websockets-16.0.tar.gz'
    sha256 '5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5'
  end

  def install
    virtualenv_install_with_resources
    rw_info = python_shebang_rewrite_info("#{libexec}/bin/python3")
    rewrite_shebang rw_info, 'csshi'
    bin.install 'csshi'
  end

  test do
    system bin / 'csshi', '--help'
  end
end
