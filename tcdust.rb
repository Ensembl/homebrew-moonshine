class Tcdust < Formula

  desc "Finds low complexity repeats with more efficient IO"

  url 'git@github.com:Ensembl/tcdust.git', :using => :git, :revision => 'master'
  #url "file:///nfs/gns/homes/ayates/linuxbrew/private_source/tcdust-1.0.0.tar.gz"
  #sha256 "5e5b02e80415c5916adbd05c5872fce6508a712f909cc090bcd71ac3804ab6d0"
  version "1.0.0"

  def install 
    system 'make'
    bin.install 'tcdust'
  end

  test do
    system 'tcdust'
  end
end
