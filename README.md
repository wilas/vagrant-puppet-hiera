# Description

Playing with puppet hiera and vagrant.

## VM description
 
 - OS: Scientific linux 6
 - simple vm: pie.farm

## Howto

 - create SL64_box using [veewee-SL6-box](https://github.com/wilas/veewee-vagrant-SL6-x86_64)
 - copy ssh_keys from [ssh-gerwazy](https://github.com/wilas/ssh-gerwazy)

```
    vagrant up
    ssh root@77.77.77.55 #pie
    vagrant destroy
```

## Bibliography

 - hiera: http://docs.puppetlabs.com/hiera/1
 - using hiera: https://puppetlabs.com/blog/first-look-installing-and-using-hiera/
 - other puppet links: https://github.com/wilas/vagrant-puppet-flat

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

