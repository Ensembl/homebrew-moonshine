class OracleInstantClient < Formula

  desc "Programs for accessing Oracle"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/instantclient-basic-linux.x64-12.1.0.2.0.zip"
  sha256 "c4e1b7201f23bc855782157ebeaaa3635eb6f5f01189bc1d3335bbdadfcb1fbb"
  version "12.1.0.2.0"

  resource "sdk" do
    url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/instantclient-sdk-linux.x64-12.1.0.2.0.zip"
    sha256 "ba4b1b96b9f00bc36682542df575f1d52717f6ad48436f50c85b2e87b3a6961c"
  end

  resource "sqlplus" do
    url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip"
    sha256 "b52a7fca7279d4e9584674ea6f24464411f62f6ba95a2a16ec92979e99cac4bd"
  end

  def install 
    resource('sdk').stage do
      prefix.install 'sdk'
    end

    resource('sqlplus').stage do
      bin.install 'sqlplus'
      lib.install 'libsqlplus.so'
      lib.install 'libsqlplusic.so'
    end

    bin.install 'adrci'
    bin.install 'genezi'
    bin.install 'uidrvci'

    extlib.install Dir['*.jar']
    lib.install Dir['*.so*']
  end

  test do
    system 'false'
  end
end
