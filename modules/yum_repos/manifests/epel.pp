class yum_repos::epel {

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6":
        ensure => file,
        owner  => "root",
        group  => "root",
        mode   => "0444",
        source => "puppet:///modules/yum_repos/RPM-GPG-KEY-EPEL-6",
    }

    yumrepo { 
        "epel":
            enabled    => hiera('enabled_epel',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - $basearch',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
            tag        => 'epel';
        "epel-debuginfo":
            enabled    => hiera('enabled_epel_debuginfo',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - $basearch - Debug',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch',
            tag        => 'epel';
        "epel-source":
            enabled    => hiera('enabled_epel_source',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - $basearch - Source',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=$basearch',
            tag        => 'epel';
        "epel-testing":
            enabled    => hiera('enabled_epel_testing',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch',
            tag        => 'epel';
        "epel-testing-debuginfo":
            enabled    => hiera('enabled_epel_testing_debuginfo',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Debug',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch',
            tag        => 'epel';
        "epel-testing-source":
            enabled    => hiera('enabled_epel_testing_source',0),
            descr      => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Source',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch',
            tag        => 'epel';
    }
    
    Yumrepo <| tag == 'epel' |> { 
        failovermethod => 'priority',
        gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        gpgcheck       => 1,
        require        => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6"],
    }
}
