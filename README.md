Test Driven Infrastructure
====


[![Build Status](https://travis-ci.org/tcnksm/test-driven-infra.svg?branch=master)](https://travis-ci.org/tcnksm/test-driven-infra)



## What is this ?

This is experimental repository for myself to try building infrastructure with TDD style using Chef.


## Overview

### Static test

- [knife test](http://docs.opscode.com/knife_cookbook.html#test) for ruby syntax check
- [foodcritic](http://acrmp.github.io/foodcritic/) for lint
- [chefspec](https://github.com/sethvargo/chefspec) for unit-test


### Dynamic test

Use Test-kitchen

- Drivers
    - [vagrant](https://github.com/test-kitchen/kitchen-vagrant)
    - [digitalocean](https://github.com/test-kitchen/kitchen-digitalocean)
- Bussers
    - [serverspec](https://github.com/test-kitchen/busser-serverspec)


## How to create cookbook


### Setup

At first, install all dependencies

```bash
$ bundle install --path vendor/bundle --binstubs .bundle/bin
```

Create `.env` file for kitchen-digitalocean secret key.

```ruby
DIGITALOCEAN_CLIENT_ID: ""
DIGITALOCEAN_API_KEY: ""
SSH_KEY_IDS: ""
```

Enable [dotenv](https://github.com/bkeepers/dotenv) in `bin/kitchen`

```ruby
require 'dotenv'
Dotenv.load
```

### Development

Run static test with guard

```bash
$ bundle exec guard
```

Create cookbook. By [knife-spec](https://github.com/sethvargo/knife-spec), this also generate default chefspec tests.

```bash
$ bundle exec knife cookbook create httpd
```

Run dynamic (integrate) test at end.

```bash
$ bundle exec rake kitchen:all
```

## How to start this repository

### Guard

Create initial Guardfile with [guard-rake](https://github.com/rubyist/guard-rake).

```bash
$ bundle exec guard init rake
```
While creating rules, refered [guard-chef](https://github.com/guard/guard-chef).

### Test-kitchen

Generating initial settings

```bash
$ bundle exec kitchen init -D kitchen-digitalocean
```

To use kitchen-digitalocean, we need to secret environmental varialbes like `DIGITALOCEAN_CLIENT_ID`. To handle it, use [dotenv](https://github.com/bkeepers/dotenv) and create `.env` file. And also create rake tasks.

And setup serverspec for busser.

```bash
$ cd test/integration/default/
$ bundle exec serverspec-init
$ rm Rakefile
$ mv spec serverspec
```
