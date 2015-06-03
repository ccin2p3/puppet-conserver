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

### Beginning with conserver

## Usage

### Simple

```puppet
class {conserver:
  enable_server => true
}
conserver::config::console { 'foo':
  'type' => 'exec',
  'rw'   => '*',
  'exec' => 'ssh foo',
  'master' => 'conserver'
}
```

### Master list

```puppet
class {conserver:
  enable_server => true
  masters => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
}
 # automatic master
conserver::config::console { 'foo':
  'type' => 'exec',
  'rw'   => '*',
  'exec' => 'ssh foo',
}
```

## Reference

### Class conserver

#### Parameters

List of parameters in the form: <param_name> (Type/Default_value).
If Default_value is auto: automatic based on osfamily.
If Default_value is absent: no default value, and parameter is mandatory.

* server_package_name (String/auto) overrides conserver package name to install
* client_package_name (String/auto) overrides console package name to install
* service_name (String/auto) overrides service name to manage
* confdir (String/auto) overrides configuration directory path
* masters (Array/`[]`) list of conserver masters in your site. This will feed the defined consoles where the master name is omitted
* reload_cmd (String/auto) overrides service reload command. Reloads are done when the conserver config file changed
* restart_cmd (String/auto) overrides service restart command. Restarts are done when the init config file changes.
* enable_client (Bool/`true`) controls wether conserver is enabled
* enable_server (Bool/`true`) controls wether console is enabled
* manage_package (Bool/`true`) controls wether packages shall be managed
* manage_init_defaults (Bool/`true`) controls wether sysvinit default files shall be managed
* server_init_config_file (String/auto) overrides sysvinit configfile path
* server_init_config_hash (Hash/{}) will be merged to OS default. Add any key/values here that may be used by the startup script
* check_config_syntax (Bool/`true`) controls wether conserver syntax shall be checked before deployment
* use_hiera (Bool/`true`) controls wether the module should harvest hiera for config items

### Define conserver::config::access

### Define conserver::config::break

### Define conserver::config::console

### Define conserver::config::default

### Define conserver::config::group

### Define conserver::config::custom

## Limitations

Currently only conserver config is being handled.

## Development

Issues and patches on github

