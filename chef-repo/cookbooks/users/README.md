Users Cookbook
=================

This is a users cookbook.

Requirements
------------

### Platform:

*List supported platforms here*

### Cookbooks:

*List cookbook dependencies here*

Attributes
----------

*List attributes here*

Recipes
-------

### users::default

*Explain what the recipe does here*

Testing
-------

Vagrant Prep for OSX:
---------------------
1) Install Vagrant: http://www.vagrantup.com/downloads.html
2) Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
3) Kitchen is ready to go!

The cookbook provides the following Rake tasks for testing:

    rake acceptance                   # Alias for kitchen:all
    rake all                          # Run all tests
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-centos-65    # Run default-centos-65 test instance
    rake kitchen:default-ubuntu-1204  # Run default-ubuntu-1204 test instance
    rake lint                         # Run linters
    rake lint:foodcritic              # Run foodcritic lint checks
    rake lint:rubocop                 # Run Rubocop lint checks
    rake spec                         # Run chefspec tests
    rake test                         # Run all tests except Kitchen (default)


License and Author
------------------

Author:: YOUR_NAME (YOUR_EMAIL)

Copyright:: YEAR, YOUR_NAME

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
