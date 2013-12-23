require "buildtasks/manifest/spec_helper"

describe "manifest:prepare" do

  include SC::SpecHelpers
  include SC::ManifestSpecHelpers

  before do
    std_before
  end

  def run_task; super('manifest:prepare'); end


#Jack: Start

  it "sets build_root => target.build_root/build_number/language" do
    run_task
    expected = File.join(@target.build_root, @target.build_number, 'fr')
    @manifest.build_root.should == expected
  end

  it "sets staging_root => staging_root/build_number/language" do
    run_task
    expected = File.join(@target.staging_root, @target.build_number, 'fr')
    @manifest.staging_root.should == expected
  end

  it "sets url_root => url_root/build_number/language" do
    run_task
    expected = [@target.url_root, @target.build_number, 'fr'] * '/'
    @manifest.url_root.should == expected
  end

  it "sets source_root => target.source_root" do
    run_task
    @manifest.source_root.should == @target.source_root
  end

  it "sets index_root => index_root/build_number/language" do
    run_task
    expected = [@target.index_root, @target.build_number, 'fr'] * '/'
    @manifest.index_root.should == expected
  end
#Jack: End

end
