stage { "base": before  => Stage["main"] }
stage { "last": require => Stage["main"] }

# basic config
class { "install_repos": stage => "base" }
class { "basic_package": stage => "base" }
class { "user::root": stage    => "base" }
Class["install_repos"] -> Class["basic_package"] -> Class["user::root"]

# firewall manage
service { "iptables":
    ensure => running,
    enable => true,
}
exec { 'clear-firewall':
    command     => '/sbin/iptables -F',
    refreshonly => true,
}
exec { 'persist-firewall':
    command     => '/sbin/iptables-save >/etc/sysconfig/iptables',
    refreshonly => true,
}
Firewall {
    subscribe => Exec['clear-firewall'],
    notify    => Exec['persist-firewall'],
}
class { "basic_firewall": }

$hmessage = hiera('hiera_info')
file { '/tmp/simple_hiera.txt':
    ensure  => file,
    content => "message from hiera ->$hmessage<-\n",
}
