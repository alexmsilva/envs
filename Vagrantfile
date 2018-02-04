Vagrant.configure(2) do |config|

  # config a database vm with MySQL
  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/xenial64"
    database.vm.hostname = "local-db"
    database.vm.network "private_network", ip: "192.168.10.11"
    database.vm.provision "shell", path: "bootstrap_db.sh"

    database.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        # vb.gui = true
    end
  end

  # config a webserver Apache with PHP   
  config.vm.define "apache" do |apache|
    apache.vm.box = "ubuntu/trusty64"
    apache.vm.hostname = "local-ws"
    apache.vm.network "private_network", ip: "192.168.10.10"
    apache.vm.synced_folder "/Users/alexsilva/Workspace", "/vagrant"
    apache.vm.provision "shell", path: "bootstrap_apache.sh"

    apache.vm.provider "virtualbox" do |vb|
        vb.memory = 1536
        vb.gui = true
    end
  end

  # config a webserver NGINX with PHP7   
  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/xenial64"
    nginx.vm.hostname = "local-ws"
    nginx.vm.network "private_network", ip: "192.168.10.13"
    nginx.vm.synced_folder "/Users/alexsilva/Workspace", "/vagrant"
    nginx.vm.provision "shell", path: "bootstrap_nginx.sh"

    nginx.vm.provider "virtualbox" do |vb|
        vb.memory = 1536
        # vb.gui = true
    end
  end

end
