# Unity Quick Setup

## Ruby Requirement
- It is assumed the Ruby language has already been installed (https://www.ruby-lang.org/en/downloads/).
- run gem install bundler

## Installation
- run git clone --recursive https://github.com/mjago/unity_quick_setup.git /test_project/
  This will clone unity_quick_setup into directory /test_project/, and clone Unity test-system
  into /dev/Unity/.
- run cd /test_project/
- run bundle

## To auto-run tests:
- run bundle exec ruby fsevent.rb in root directory (auto test for modified src/test files)
- modify test/test_filelist.rb to determine what gets auto-tested
