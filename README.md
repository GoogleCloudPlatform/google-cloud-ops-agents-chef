# Google Cloud Stackdriver Logging Agent Chef Cookbook

This cookbook provides the built-in types and services for Chef to manage
Google Cloud Stackdriver Logging Agent resources, as native Chef types.

### Platforms

#### Supported Operating Systems

This cookbook was tested on the following operating systems:

* RedHat 6, 7
* CentOS 6, 7
* Debian 7, 8
* Ubuntu 12.04, 14.04, 16.04, 16.10
* SLES 11-sp4, 12-sp2
* openSUSE 13
* Windows Server 2008 R2, 2012 R2, 2012 R2 Core, 2016 R2, 2016 R2 Core

## Example

    include_recipe 'google-glogging::agent'

You can also install the agent using Chef Zero (local mode):

    chef-client -z --runlist 'recipe[google-glogging::agent]'
