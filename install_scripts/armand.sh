############
# Armand
############

echo "Installing Armand"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

sudo chown -R vagrant:vagrant /vagrant/armand

cd $HOME_DIR

sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant' CREATEDB;"

. /etc/default/armand

cd /vagrant
git clone https://github.com/uhlibraries-digital/armand.git
cd /vagrant/armand

gem install bundler -q
bundle install

RAILS_ENV=development bundle exec rake db:setup
rake hyrax:default_admin_set:create

cp -f $SHARED_DIR/config/settings.local.yml /vagrant/armand/config

sudo cp $SHARED_DIR/config/sidekiq.init /etc/init.d/sidekiq
sudo chmod 755 /etc/init.d/sidekiq
sudo update-rc.d sidekiq defaults
sudo update-rc.d sidekiq enable
sudo /etc/init.d/sidekiq start

echo "Done"
