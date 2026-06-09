# frozen_string_literal: true

# Homebrew formula for csshi
class Csshi < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc 'csshi - ClusterSSH for iTerm2'
  homepage 'https://github.com/ilikejam/csshi'
  url 'https://github.com/ilikejam/csshi/archive/refs/tags/v1.21.tar.gz'
  sha256 '5eba4727da31e386b57bca180fc9cf60e105153eae9a1e4f8ee92d2ae10259af'
  license 'GPL-2.0-only'

  depends_on 'python@3.14'

  resource 'iterm2' do
    url 'https://files.pythonhosted.org/packages/4f/fb/258e7e3bfcacf9cdfc378ae4ee2aca743dbccd6a12ffceee12957f67dff3/iterm2-2.20.tar.gz'
    sha256 '168d3807cd58b3e678476852be2bb4a5cd89f008d95e37d2777d9810731cff08'
  end

  resource 'protobuf' do
    url 'https://files.pythonhosted.org/packages/60/fd/5b1491d9e4b586d621c54f4c36b888714164b6875f8d6afa3f9072906a51/protobuf-7.35.0.tar.gz'
    sha256 'a2efd84605f41e559f1881b0912b44099d0a2ac9bf46b3474823f10fb393b0e6'
  end

  resource 'pyobjc-core' do
    url 'https://files.pythonhosted.org/packages/2a/e8/a6cc12669211e7c9b29e8f26bf2159e67c7a73555dc229018abf46d8167a/pyobjc_core-12.2.tar.gz'
    sha256 '51d7de4cfa32f508c6a7aac31f131b12d5e196a8dcf588e6e8d7e6337224f66d'
  end

  resource 'pyobjc-framework-cocoa' do
    url 'https://files.pythonhosted.org/packages/6d/cc/927169225e72bab9c9b44285656768fb75052a0bc85fdbca62740e1ca43c/pyobjc_framework_cocoa-12.2.tar.gz'
    sha256 '20b392e2b7241caad0538dfde12143343e5dfe48f72e7df660a7548e635903dc'
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
