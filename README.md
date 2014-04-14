Test Driven Development for Chef cookbooks [![Build Status](https://travis-ci.org/tcnksm/test-driven-cookbook-development.svg?branch=master)](https://travis-ci.org/tcnksm/test-driven-cookbook-development) [![Coverage Status](https://coveralls.io/repos/tcnksm/test-driven-cookbook-development/badge.png)](https://coveralls.io/r/tcnksm/test-driven-cookbook-development) [![Dependency Status](https://gemnasium.com/tcnksm/test-driven-cookbook-development.svg)](https://gemnasium.com/tcnksm/test-driven-cookbook-development)
====

## Overview

### Static test

- knife test command for ruby syntax check
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

At first, install all dependencies

```bash
$ bundle install --path vendor/bundle --binstubs .bundle/bin
```

Create `.env` from `.env.org`.

```bash
$ cp .env.org .env
$ emacs .env
```

While develop, run static test

```bash
$ bundle exec guard
```

Create cookbook. By [knife-spec](https://github.com/sethvargo/knife-spec), this also generate default chefspec tests.

```bash
$ bundle exec knife cookbook create httpd
```

After develop, run dynamic (integrate) test

```bash
$ bundle exec rake kitchen:all
```

## How to start


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
