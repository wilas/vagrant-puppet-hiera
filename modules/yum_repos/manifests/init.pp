class yum_repos {

    if hiera('adm_epel_repos', undef){
        include yum_repos::epel
    }
    if hiera('adm_puppetlabs_repos', undef){
        include yum_repos::puppetlabs
    }
}
