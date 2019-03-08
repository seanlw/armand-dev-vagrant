# Armand Development Vagrant Box

## Requirements

* [Vagrant 2.1.x](https://www.vagrantup.com/)
* [VirtualBox 5.2.x](https://www.virtualbox.org/)
* [Chrome](https://www.google.com/chrome/)
* CPU: Core i5/Ryzen 5 or higher
* RAM: 8GB or higher

Windows users will need Powershell version 3 or higher. All commands are ran within Powershell.

The Chrome browser is required because of its support for subdomains on localhost `*.localhost` which Hyku Vagrant uses for repositories. Alternatively you can edit your `hosts` file and add  `127.0.0.1` to any `*.localhost` domain.

*Please note that the Hyrax stack can be resource-intensive and is not recommended for underpowered computers or on machines you intend to multi-task heavily with during your development testing.* 

## Install

1. `git clone https://github.com/seanlw/armand-dev-vagrant.git`
2. `cd armand-dev-vagrant`
3. `vagrant up`
5. Visit [http://localhost:3000](http://localhost:3000)

## Create a admin user

1. Visit [http://localhost:3000/users/sign_up?locale=en](http://localhost:3000/users/sign_up?locale=en) and create a account using `admin@uh.edu` as the Email
2. Click "Staff Interface" in the footer to access the dashboard

## Development

The Armand source code is located in the `armand` directory in `armand-dev-vagrant`. If you are ssh into the vagrant box, armand is located in `/vagrant/armand`.

SSH into the vagrant box using `vagrant ssh`.

Stopping Puma server. While sshed into the vagrant box run `sudo kill -9 $(lsof -i tcp:3000 -t)`

Starting Puma server (by default Puma starts after a `vagrant up`) run:

`cd /vagrant/armand && RAILS_ENV=development RAILS_SERVE_STATIC_FILES=true rails s -b 0.0.0.0`

## Stopping vagrant

To stop vagrant run `vagrant halt`. To remove hyku vagrant and the virtual machine run `vagrant destroy`.

## Environment

* Ubuntu 16.04 64-bit machine with:
  * [Fedora 4.x](http://fedora.info/about) at [http://localhost:8984/fedora4/rest](http://localhost:8984/fedora4/rest)
  * [Armand/Hyrax](https://github.com/samvera/hyrax) at
  [http://localhost:3000](http://localhost:3000)
  * [ImageMagick](https://www.imagemagick.org/script/index.php)
  * [Ruby 2.4.4](https://www.ruby-lang.org/)
  * [Solr 6.4.2](http://lucene.apache.org/solr/) at [http://localhost:8983/solr/](http://localhost:8983/solr/)
  * [Tomcat 7](http://tomcat.apache.org)

## Sidekiq

If you need to view the status of jobs visit the Sidekiq interface [http://example.localhost:3000/sidekiq](http://example.localhost:3000/sidekiq)

## Maintainers

Current maintainers:

* [Sean Watkins](https://github.com/seanlw)