class Repbase < Formula

  desc "Curated set of repeat libraries for RepeatMasker"
  homepage "http://www.girinst.org/repbase/index.html"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/repeatmaskerlibraries-20150807.tar.gz"
  sha256 "d03ee3ca07a0c95764be05e9ba8c83203f82cb13e87874a735e80b89447c7919"
  version "20150807"

  depends_on "ensembl/ensembl/repeatmasker" => :recommended

  def install
    libexec.install Dir["./*"]
    if build.with?("repeatmasker")
      (Formula["ensembl/ensembl/repeatmasker"].libexec/"Libraries").install_symlink libexec/"RepeatAnnotationData.pm"
      (Formula["ensembl/ensembl/repeatmasker"].libexec/"Libraries").install_symlink libexec/"RepeatMaskerLib.embl"
      (Formula["ensembl/ensembl/repeatmasker"].libexec/"Libraries").install_symlink libexec/"taxonomy.dat"
    end
   end

  def caveats; <<-EOS.undent
    Unless you used --without-repeatmasker RepeatMasker has
    been configured to use RepBase as default repeats database.
    You will need to reinstall repeatmasker to avoid using RepBase
    EOS
  end

end
