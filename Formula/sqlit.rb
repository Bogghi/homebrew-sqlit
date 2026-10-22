class Sqlit < Formula
  desc "User-friendly TUI for SQL databases"
  homepage "https://github.com/Maxteabag/sqlit"
  url "https://files.pythonhosted.org/packages/2f/87/06915ba6eb70a175e313f00e4c439fb95bf4123050604a70d1ded7117946/sqlit_tui-1.6.5.tar.gz"
  sha256 "5c842c47ac9e6e66a6bbd6bf8e279d1b5f7df1c5ab10980ce25c1f3aaa7af0ee"
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
