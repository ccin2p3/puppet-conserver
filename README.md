# ccin2p3-conserver

[![Build Status](https://api.travis-ci.org/ccin2p3/puppet-conserver.svg?branch=v0.2.4)](https://travis-ci.org/ccin2p3/puppet-conserver)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What conserver affects](#what-conserver-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with conserver](#beginning-with-conserver)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

This puppet module will manage the [conserver](http://www.conserver.com) application.
From the website: *Conserver is an application that allows multiple users to watch a serial console at the same time*.

## Module Description

This module will manage the conserver application by installing required packages, setting up the configuration file, and enabling the service.

## Setup

### What conserver affects

This module will affect the following resources, some of which are optional.

* conserver master configuration file
* console configuration file
* conserver init defaults file (optional)
* conserver and console package installation (optional)
* conserver service

### Setup Requirements

* puppetlabs/concat
* puppetlabs/stdlib
* puppet > 3.5.0

### Beginning with conserver

## Usage

### Simple

```puppet
include ::conserver
conserver::config::console { 'foo':
  'config' => {
    'type' => 'exec',
    'rw'   => '*',
    'exec' => 'ssh foo',
    'master' => 'conserver'
  }
}
```

### Automatic master

```puppet
class { conserver:
  masters => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
}
 # automatic master
conserver::config::console { 'foo':
  'config' => {
    'type' => 'exec',
    'rw'   => '*',
    'exec' => 'ssh foo',
  }
}
```

### Hiera

```puppet
class { conserver:
  use_hiera => true
}
```
```YAML
conserver::config::console:
  bar:
    config:
      type: device
      device: /dev/ttyUSB0
```

## Reference

### Class conserver

#### Parameters

List of parameters in the form: <param_name> (Type/Default_value).
If Default_value is auto: automatic based on osfamily.
If Default_value is absent: no default value, and parameter is mandatory.

* `server_package_name` (String/auto) overrides conserver package name to install
* `client_package_name` (String/auto) overrides console package name to install
* `service_name` (String/auto) overrides service name to manage
* `confdir` (String/auto) overrides configuration directory path
* `masters` (Array/`[]`) list of conserver masters in your site. This will feed the defined consoles where the master name is omitted
* `reload_cmd` (String/auto) overrides service reload command. Reloads are done when the conserver config file changed
* `restart_cmd` (String/auto) overrides service restart command. Restarts are done when the init config file changes.
* `enable_client` (Bool/`true`) controls wether conserver is enabled
* `enable_server` (Bool/`true`) controls wether console is enabled
* `manage_package` (Bool/`true`) controls wether packages shall be managed
* `manage_init_defaults` (Bool/`true`) controls wether sysvinit default files shall be managed
* `server_init_config_file` (String/auto) overrides sysvinit configfile path
* `server_init_config_hash` (Hash/{}) will be merged to OS default. Add any key/values here that may be used by the startup script
* `check_config_syntax` (Bool/`true`) controls wether conserver syntax shall be checked before deployment
* `use_hiera` (Bool/`true`) controls wether the module should harvest hiera for config items

### Define conserver::config::config

Conserver `config` block.

#### Parameters

* `config` (Hash) See `conserver.cf` manpage
* `order` (String/`'25'`) Position in config file

#### Example

```Puppet
conserver::config::config {'*':
  config => {
    'primaryport' => 33000,
    'unifiedlog'  => '/var/log/conserver/console.log',
    'logfile'     => '/var/log/conserver/server.log',
  }
}
```
### Define conserver::config::access

Conserver `access` block.
See `conserver.cf` manpage.

#### Parameters

* `trust` (Array) List of trusted masters
* `limited` (Array) List of masters with limited access
* `rejected` (Array) List of masters with no access
* `order` (String/`'15'`) Position in config file

#### Example

```Puppet
conserver::config::access { '*':
  trust => [ 'conserv01', 'conserv02' ]
}
```

### Define conserver::config::break

Conserver `break` block.
See `conserver.cf` manpage.

#### Parameters

* `string` (String)
* `delay` (Int)
* `order` (String/`'02'`) Position in config file

#### Example

```Puppet
conserver::config::break { '1':
  string => '\d\035send brk\n'
}
```

### Define conserver::config::console

Conserver block to define a `console`.

#### Parameters

* `config` (Hash)
* `order` (String/`'45'`) Position in config file

#### Example

```Puppet
conserver::config::console { 'node73':
  config => {
    master  => 'conserv01',
    include => 'cyclades_sp16',
    device  => '/dev/ttyC0'
  }
}
```

### Define conserver::config::default

Conserver `default` block.
See `conserver.cf` manpage.

#### Parameters

* `config` (Hash)
* `order` (String/`'25'`) Position in config file

#### Examples

```Puppet
conserver::config::default { 'cyclades_sp16':
  config => {
    type   => 'device',
    parity => 'none',
    baud   => 9600,
    break  => 3,
  }
}
```

### Define conserver::config::group

Conserver `group` block. Defines user groups.

See `conserver.cf` manpage.

#### Parameters

* `users` (Array) list of users belonging to group
* `order` (String/`'05'`) Position in config file

#### Example

```Puppet
conserver::config:: { 'devops':
  users => [ 'john', 'sarah' ]
}
```

### Define conserver::config::custom

Custom conserver blocks, for which there is no specific `conserver::config::*` define.
As parameter you can either use raw `content` (*e.g.* for comments), or `template` and `config`.
For convenience, the module ships `server/custom.erb` which will generate key-values.

#### Parameters

* `content` (String/`$title`) Raw block content.
* `template` (String/`undef`) Path to template which will be used to build block
* `config` (Hash) Hash content. Used in template
* `order` (String/`'01'`) Position in config file

#### Example

```Puppet
conserver::config::custom { '# this is a comment in conserver.cf': }
conserver::config::custom { 'unsupportedblock foo':
  template => 'conserver/server/custom.erb',
  config  => {
    'foo' => 'bar'
  }
}
```

### Define conserver::config::client

Client configuration block (for configuring `console` *e.g.* `/etc/console.cf`).

#### Parameters

* `config` (Hash)
* `order` (String/`'01'`) Position in config file

#### Example

```Puppet
conserver::config::client {'*':
  config => {
    'master' => 'conserv02',
    'port'   => 33000,
  }
}
```

## Limitations

Only tested on RHEL6 and RHEL7

## Development

Issues and patches on github

