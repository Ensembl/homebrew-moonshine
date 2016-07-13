class Tcdust < Formula

  desc "Finds low complexity repeats with more efficient IO"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/tcdust-1.0.0.tar.gz"
  sha256 "94b83fca02339cfa644fe3ff0ca4f4f0ef603bb0f8960db7111c35af304f4d2f"
  version "1.0.0"

  def install 
    system 'make'
    bin.install 'tcdust'
  end

  test do
    system 'tcdust'
  end
end
