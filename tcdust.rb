class Tcdust < Formula

  desc "Finds low complexity repeats with more efficient IO"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/tcdust-1.0.0.tar.gz"
  sha256 "5e5b02e80415c5916adbd05c5872fce6508a712f909cc090bcd71ac3804ab6d0"
  version "1.0.0"

  def install 
    system 'make'
    bin.install 'tcdust'
  end

  test do
    system 'tcdust'
  end
end
