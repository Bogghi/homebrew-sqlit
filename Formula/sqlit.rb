class Sqlit < Formula
  desc "User-friendly TUI for SQL databases"
  homepage "https://github.com/Maxteabag/sqlit"
  url "https://files.pythonhosted.org/packages/70/39/c84577fdade8a260ad1b7396ce3eba53e6404ca31df45d86c557e0978417/sqlit_tui-1.6.4.tar.gz"
  sha256 "7f7058b062c0e868bde867047928283909abaa27eb9bb527603b83fe71bdf1d6"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Prebuilt wheels: the dependency tree includes pyarrow, which is impractical to build from source.
    venv = libexec
    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/sqlit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqlit --version")
  end
end
