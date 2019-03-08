# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

	config.vm.hostname = "armand-dev"

	config.vm.box = "ubuntu/xenial64"
	config.vm.box_version = "20180529.0.0"

	config.vm.network :forwarded_port, guest: 3000, host: 3000 # Armand
	config.vm.network :forwarded_port, guest: 8983, host: 8983 # Solr
	config.vm.network :forwarded_port, guest: 8984, host: 8984 # Fedora

	config.vm.provider "virtualbox" do |v|
		v.memory = 6096
	end

	shared_dir = "/vagrant"

	config.vm.synced_folder "./data_store", "/data_store",
		create: true,
		mount_options: ["dmode=777,fmode=777"]

	config.vm.provision "shell", path: "./install_scripts/bootstrap.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/dnsmasq.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/env-vars.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/fedora4.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/solr.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/ruby.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/fits.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/imagemagick.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/armand.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", inline: "cd /vagrant/armand && RAILS_ENV=development RAILS_SERVE_STATIC_FILES=true rails s -b 0.0.0.0 -d", privileged: false, run: "always"
	config.vm.provision "shell", inline: "/etc/init.d/sidekiq start", run: "always"

end
