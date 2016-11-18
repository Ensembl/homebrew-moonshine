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

    execbin=(libexec+'bin')
    execbin.mkpath

    resource('sdk').stage do
      prefix.install 'sdk'
      # (prefix+'rdbms/demo').mkpath
      # demo_mk = prefix+'sdk/demo/demo.mk'
      # target_mk = prefix+'rdbms/demo/demo_xe.mk'
      # File.symlink(demo_mk, target_mk) if demo_mk.exist? && !target_mk.exist?
    end

    resource('sqlplus').stage do
      execbin.install 'sqlplus'
      lib.install 'libsqlplus.so'
      lib.install 'libsqlplusic.so'
    end

    execbin.install 'adrci'
    execbin.install 'genezi'
    execbin.install 'uidrvci'

    libexec.install Dir['*.jar']
    lib.install Dir['*.so*']

    bin.install Dir[execbin/"*"]
    bin.env_script_all_files(execbin, :LD_LIBRARY_PATH => "#{lib}")
  end

  test do
    system 'false'
  end
end
