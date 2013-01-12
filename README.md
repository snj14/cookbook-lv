Description
===========

- install lv ( http://www.mt.cs.keio.ac.jp/person/narita/lv/ )
- tested on CentOS 6.3, ubuntu 12.04


Test On CentOS 6.3
==================

    mkdir ~/vagrant-test-centos63
    cd ~/vagrant-test-centos63
    cat <<EOS > Vagrantfile
    Vagrant::Config.run do |config|
      config.vm.box = "centos63"
      config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
      config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "/PATH/TO/COOKBOOKS"
        chef.add_recipe "lv"
        chef.run_list = ["recipe[lv]"]
      end
    end
    EOS
    vagrant up
    vagrant ssh
    which lv

Test On Ubuntu 12.04
=====================

    mkdir ~/vagrant-test-ubuntu1204
    cd ~/vagrant-test-ubuntu1204
    cat <<EOS > Vagrantfile
    Vagrant::Config.run do |config|
      config.vm.box = "ubuntu1204"
      config.vm.box_url = "http://files.vagrantup.com/precise64.box"
      config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "/PATH/TO/COOKBOOKS"
        chef.add_recipe "lv"
        chef.run_list = ["recipe[lv]"]
      end
    end
    EOS
    vagrant up
    vagrant ssh
    which lv
