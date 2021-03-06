# Unity Quick Setup

Quick project setup for a C project using the Unity unit-test system, and auto-testing via rb-fsevent.
More information of the Unity test-system can be found at:

  http://www.throwtheswitch.org

Unity Quick Setup Directory Structure:

- test_project
  - Gemfile
  - fsevent.rb
  - src
    - source files
    - header files
  - test
    - test files
    - testfile_list.rb
  - dev
    - custom
      - rakefile.rb
      - rakefile_helper.rb
    - Unity
      - unity files and directories

## Ruby Requirement
- It is assumed the Ruby language has already been installed (https://www.ruby-lang.org/en/downloads/).
- gem install bundler

## Installation
```
git clone --recursive https://github.com/mjago/unity_quick_setup.git  test_project
cd test_project
gem install bundle
bundle install
bundle exec ruby autorun.rb
```
- This will clone unity_quick_setup into directory ./test_project, and clone Unity test-system
  into ./test_project/dev/Unity/.

## auto-run tests:
- bundle exec ruby autorun.rb in root directory (auto test for modified src/test files)
  - now saving changes in source or test files will trigger the auto-test mechanism
- modify test/testfile_list.rb to determine what gets auto-tested

## Expand Project
- Expand project by modifying dev/custom/target/gcc_template.yml.
- More target configs available in dev/Unity/test/targets directory.
