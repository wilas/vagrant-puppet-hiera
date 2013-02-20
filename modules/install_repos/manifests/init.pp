class install_repos {

    include install_repos::epel
    include install_repos::puppetlabs
}
