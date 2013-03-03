class yum_repos::puppetlabs {

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
        ensure => file,
        owner  => 'root',
        group  => 'root',
        mode   => '0444',
        source => 'puppet:///modules/yum_repos/RPM-GPG-KEY-puppetlabs',
    }

    yumrepo {
        'puppetlabs-products':
            enabled  => hiera('enabled_puppetlabs_products',0),
            descr    => 'Puppet Labs Products EL 6 - $basearch',
            baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
            tag      => 'puppet';
        'puppetlabs-deps':
            enabled  => hiera('enabled_puppetlabs_deps',0),
            descr    => 'Puppet Labs Dependencies EL 6 - $basearch',
            baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
            tag      => 'puppet';
        'puppetlabs-devel':
            enabled  => hiera('enabled_puppetlabs_devel',0),
            descr    => 'Puppet Labs Devel EL 6 - $basearch',
            baseurl  => 'http://yum.puppetlabs.com/el/6/devel/$basearch',
            tag      => 'puppet';
    }

    Yumrepo <| tag == 'puppet' |> {
        gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
        gpgcheck       => 1,
        require        => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
    }
}