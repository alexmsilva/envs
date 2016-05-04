Vagrant.configure(2) do |config|
   config.vm.box = "ubuntu/trusty64"

   # Config webserver Apache with PHP   
   config.vm.define "apache" do |apache|
      config.vm.hostname = "apache"
      config.vm.network "private_network", ip: "192.168.10.10"
      config.vm.synced_folder "/Users/alex/Sites", "/vagrant"
      config.vm.provision "shell", path: "bootstrap_apache.sh"
   end
end
