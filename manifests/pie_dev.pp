# Error: Cannot reassign variable environment at
# check it also with puppet master and node declaration
#$environment = 'dev'

$vm_env = 'dev'

# Include classes - search for classes in *.yaml/*.json files
hiera_include('classes')

# Some classes order
Class['yum_repos'] -> Class['basic_package'] -> Class['user::root']

# Node global
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