class basic_firewall {

    #update when firewall 1.0: http://projects.puppetlabs.com/issues/10025
    #set sysctl ipv4 settings, use augeas !
    #change default chain policy: http://projects.puppetlabs.com/issues/10162 !

    # firewall service manage
    service { 'iptables':
        ensure => hiera('basic_firewall::iptables_ensure','running'),
        enable => hiera('basic_firewall::iptables_enable',true),
    }

    resources { 'firewall':
        purge => true,
    }

    firewall { '001 accept all icmp requests':
        proto  => 'icmp',
        action => accept,
    }

    firewall { '002 INPUT allow loopback':
        iniface => 'lo',
        chain   => 'INPUT',
        action  => accept,
    }

    firewall { '000 INPUT allow related and establishedsa':
        state  => ['RELATED', 'ESTABLISHED'],
        action => accept,
        proto  => 'all',
    }

    firewall { '100 allow ssh':
        state  => ['NEW'],
        dport  => '22',
        proto  => 'tcp',
        action => accept,
    }

    firewall { '998 deny all other requests':
        action => reject,
        proto  => 'all',
        reject => 'icmp-host-prohibited',
    }

    firewall { '999 deny all other requests':
        chain  => 'FORWARD',
        action => reject,
        proto  => 'all',
        reject => 'icmp-host-prohibited',
    }
}