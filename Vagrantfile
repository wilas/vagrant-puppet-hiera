# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    vm_name= "pie"
    config.vm.box = "SL6"
    config.vm.host_name = "#{vm_name}.farm"
    config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]

    config.vm.network :hostonly, "77.77.77.55"
    config.vm.share_folder "v-root", "/vagrant", "."

    config.vm.provision :puppet do |puppet|
        puppet.options = "--hiera_config hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "pie.pp"
        puppet.module_path = "modules"

        # custom facts provided to Puppet
        # easy way to play with hiera (Creating Hierarchies - http://docs.puppetlabs.com/hiera/1/hierarchy.html)
        # turn on/off is_vagrant variable to see diffrent behaviour
        puppet.facter = {
            "is_vagrant" => true,
        }
    end
end
