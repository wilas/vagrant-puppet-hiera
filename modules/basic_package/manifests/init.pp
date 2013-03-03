class basic_package {

    $basic_pkg = hiera_array('basic_package')
    package { $basic_pkg:
        ensure => installed,
    }

    $basic_erase_pkg = hiera_array('basic_erase_package', undef)
    if $basic_erase_pkg {
        package { $basic_erase_pkg:
            ensure => absent,
        }
    }

    # package from vagrant box creation
    $vagrant_pkg = hiera_array('vagrant_box_package', undef)
    if $vagrant_pkg {
        package { $vagrant_pkg:
            ensure => installed,
        }
    }

    # gem package
    $gem_pkg = hiera_array('gem_package', undef)
    if $gem_pkg {
        package { $gem_pkg:
            ensure   => installed,
            provider => 'gem',
            require  => Package['rubygems'],
        }
    }
}