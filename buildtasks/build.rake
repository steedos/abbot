# ===========================================================================
# SC::Target Buildtasks
# copyright 2008, Sprout Systems, Inc. and Apple, Inc. all rights reserved
# ===========================================================================

# Tasks invoked while building Target objects.  You can override these methods
# in your buildfiles.  You can also define new builders and assign them to
# manifest entries if you also override/extend manifest:build.
namespace :build do

  desc "copies a single resource"
  build_task :copy do
    require 'fileutils'
    FileUtils.mkdir_p(File.dirname(DST_PATH))
    FileUtils.cp_r(SRC_PATH, DST_PATH)
  end

  desc "builds a single css files"
  build_task :css do
    SC::Builder::Stylesheet.build ENTRY, DST_PATH
  end

  desc "builds a single sass file"
  build_task :sass do
    SC::Builder::Sass.build ENTRY, DST_PATH
  end
  
  desc "builds a single javascript file"
  build_task :javascript do
    SC::Builder::JavaScript.build ENTRY, DST_PATH
  end
  
  desc "builds an html file, possibly executing render tasks"
  build_task :html do
  end

  namespace :combine do
    
    desc "combines several css files into a single css file" 
    build_task :css do
    end
    
    desc "combines several javascript files into a single javascript file"
    build_task :javascript do
    end
    
  end
  
end