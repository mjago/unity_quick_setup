# Modified Rakefile for unity_quickstart

# ==========================================
#   Unity Project - A Test Framework for C
#   Copyright (c) 2007 Mike Karlesky, Mark VanderVoord, Greg Williams
#   [Released under MIT License. Please refer to license.txt for details]
# ==========================================

UNITY_ROOT = File.expand_path(File.dirname(__FILE__) + '/../Unity/test/') + '/'
PROJECT_ROOT = File.expand_path(File.dirname(__FILE__) + '/../../') + '/'

require 'rake'
require 'rake/clean'
require PROJECT_ROOT + 'dev/custom/rakefile_helper'
require PROJECT_ROOT + 'test/testfile_list.rb'

TEMP_DIRS = [
        File.join(PROJECT_ROOT, 'dev/custom/build')
]

TEMP_DIRS.each do |dir|
  directory(dir)
  CLOBBER.include(dir)
end

task :prepare_for_tests => TEMP_DIRS

include RakefileHelpers

# Load proper GCC as defult configuration
DEFAULT_CONFIG_FILE = 'gcc_auto_stdint.yml'

#configure_toolchain(DEFAULT_CONFIG_FILE)

load_configuration(PROJECT_ROOT + 'dev/custom/target/gcc_template.yml')
#configure_toolchain(PROJECT_ROOT + 'targets/gcc_template.yml')

desc "Test unity with its own unit tests"

# task :unit => [:prepare_for_tests] do
#   run_tests get_unit_test_files
# end

task :unit => [:clean, :prepare_for_tests] do
  tests = TestList.new
  tests.test_all ?
    run_tests(get_unit_test_files) :
    run_tests(tests.testfile_list)
end

desc "Test unity's helper scripts"
task :scripts => [:prepare_for_tests] do
  Dir['tests/test_*.rb'].each do |scriptfile|
    require "./"+scriptfile
  end
end

desc "Generate test summary"
task :summary do
  report_summary
end

desc "Build and test Unity"
task :all => [:clean, :prepare_for_tests, :scripts, :unit, :summary]
task :default => [:clobber, :all]
task :ci => [:no_color, :default]
task :cruise => [:no_color, :default]

desc "Load configuration"
task :config, :config_file do |t, args|
  configure_toolchain(args[:config_file])
end

task :no_color do
  $colour_output = false
end
