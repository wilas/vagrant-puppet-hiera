# Description

Playing with puppet hiera and vagrant. Creating hierarchies, managing multiple environments.

## VM description
 
 - OS: Scientific linux 6
 - simple vms: pie_{prod,stage,test}.farm

## Howto

 - create SL6 box using [veewee-boxarium](https://github.com/wilas/veewee-boxarium)
 - copy ssh_keys from [ssh-gerwazy](https://github.com/wilas/ssh-gerwazy)

```
    vagrant up
    ssh root@77.77.77.55 #pie_prod
    ssh root@77.77.77.56 #pie_stage
    ssh root@77.77.77.57 #pie_test
    vagrant destroy
```

## Bibliography

 - hiera: http://docs.puppetlabs.com/hiera/1
 - using hiera: https://puppetlabs.com/blog/first-look-installing-and-using-hiera/
 - !!! configuration variables and hiera: http://www.craigdunn.org/2011/10/puppet-configuration-variables-and-hiera/
 - puppet backend - hiera: http://www.devco.net/archives/2011/06/11/puppet_backend_for_hiera_part_2.php
 - puppet conf. environments (auth.conf on master): http://docs.puppetlabs.com/guides/environment.html
 - why hiera?: https://puppetlabs.com/blog/the-problem-with-separating-data-from-puppet-code/
 - other puppet links: https://github.com/wilas/vagrant-puppet-flat
 - env. + git: "Each environment can thus be a branch of the main environment."
 - multiple backends: http://projects.puppetlabs.com/issues/13954


## Copyright and license

Copyright 2013, Kamil Wilas (wilas.pl)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

