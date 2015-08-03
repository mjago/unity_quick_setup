require 'rb-fsevent'

puts 'Running FS_Event Monitor:'

PROJECT_ROOT = File.expand_path(File.dirname(__FILE__)) + '/'

def run_build
#  system "bundle exec rake unit -f dev/Unity/test/rakefile"
  system "bundle exec rake -f dev/custom/rakefile.rb"
end

def run_tests
  puts "Detected change"
  puts Time.now
  run_build
  $run_tests = false
  puts 'done'
  puts '.   .   .   .   .   .   .   .   .   .   .'
  puts
end

$fsevent = FSEvent.new
$root =  PROJECT_ROOT
$src  =  PROJECT_ROOT + 'src/'
$test =  PROJECT_ROOT + 'test/'

$fsevent.watch [$root] do |directories|
  directory = directories[0].to_s
  if directory == $src || directory == $test
    run_tests
  end
end

$fsevent.run
























