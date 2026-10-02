class Sqlit < Formula
  include Language::Python::Virtualenv

  desc "User-friendly TUI for SQL databases"
  homepage "https://github.com/Maxteabag/sqlit"
  url "https://files.pythonhosted.org/packages/70/39/c84577fdade8a260ad1b7396ce3eba53e6404ca31df45d86c557e0978417/sqlit_tui-1.6.4.tar.gz"
  sha256 "7f7058b062c0e868bde867047928283909abaa27eb9bb527603b83fe71bdf1d6"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqlit --version")
  end
end
