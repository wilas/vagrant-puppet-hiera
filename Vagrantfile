# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :pie_prod do |node_conf|
    vm_name= "pie_prod"
    node_conf.vm.box = "SL6"
    node_conf.vm.host_name = "#{vm_name}.farm"
    node_conf.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]

    node_conf.vm.network :hostonly, "77.77.77.55"
    node_conf.vm.share_folder "v-root", "/vagrant", "."

    node_conf.vm.provision :puppet do |puppet|
        puppet.options = "--hiera_config hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "pie_prod.pp"
        puppet.module_path = "modules"

        # custom facts provided to Puppet
        # turn on/off vm_type variable to see diffrent behaviour
        puppet.facter = {
            #"environment" => "production",
            "vm_type" => "vagrant",
        }
    end
  end
  config.vm.define :pie_stage do |node_conf|
    vm_name= "pie_stage"
    node_conf.vm.box = "SL6"
    node_conf.vm.host_name = "#{vm_name}.farm"
    node_conf.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]

    node_conf.vm.network :hostonly, "77.77.77.56"
    node_conf.vm.share_folder "v-root", "/vagrant", "."

    node_conf.vm.provision :puppet do |puppet|
        puppet.options = "--hiera_config hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "pie_stage.pp"
        puppet.module_path = "modules"

        # custom facts provided to Puppet
        # turn on/off vm_type variable to see diffrent behaviour
        puppet.facter = {
            #"environment" => "staging",
            "vm_type" => "vagrant",
        }
    end
  end
  config.vm.define :pie_test do |node_conf|
    vm_name= "pie_test"
    node_conf.vm.box = "SL6"
    node_conf.vm.host_name = "#{vm_name}.farm"
    node_conf.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]

    node_conf.vm.network :hostonly, "77.77.77.57"
    node_conf.vm.share_folder "v-root", "/vagrant", "."

    node_conf.vm.provision :puppet do |puppet|
        puppet.options = "--hiera_config hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "pie_test.pp"
        puppet.module_path = "modules"

        # custom facts provided to Puppet
        # turn on/off vm_type variable to see diffrent behaviour
        puppet.facter = {
            #"environment" => "test",
            "vm_type" => "vagrant",
        }
    end
  end
end
