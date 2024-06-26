# Changelog

This uses semantic versioning

## 2024-03-20 Release 1.2.0

* Add EL9 support

## 2021-06-24 Release 1.1.0

* Add EL8 support

## 2018-04-04 Release 1.0.0

* Drop support for puppet < 4.9.1
* Revive tests

## 2017-04-04 Release 0.3.3

* add support for puppet 4
* add support for Debian/Ubunto (Vincent Bernat)
* configure clients using hiera (Vincent Bernat)

## 2017-04-04 Release 0.3.2 (UNRELEASED)

* fix puppet 3 support

## 2017-04-04 Release 0.3.1 (UNRELEASED)

* add support for puppet 4

## 2015-09-08 Release 0.2.4
* real documentation
* custom blocks can use hash using template

## 2015-08-13 Release 0.2.3
* harvest hiera for conserver::config::config type

## 2015-08-10 Release 0.2.2
* revert 0.2.1
* manage file permissions for console.cf and conserver.cf
* support config blocks on master e.g. `config * {}`

## 2015-08-10 UNRELEASED 0.2.1
* fix incorrect sysvinit file location for EL6

## 2015-08-05 Release 0.2.0
* add define to add multiple consoles at once
  this is much faster

## 2015-08-04 Release 0.1.0
* release yo
