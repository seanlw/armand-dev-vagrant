############
# Fits
############

echo "Installing fits"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/fits-1.4.0.zip" ]; then
  echo -n "Downloading fits 1.4.0..."
  wget -q "https://github.com/harvard-lts/fits/releases/download/1.4.0/fits-1.4.0.zip" -O "$DOWNLOAD_DIR/fits-1.4.0.zip"
  echo "Done"
fi

cp $DOWNLOAD_DIR/fits-1.4.0.zip /tmp
cd /tmp
unzip -q fits-1.4.0.zip -d /opt/fits
chmod a+x /opt/fits/fits.sh
touch /opt/fits/fits.log
chmod a+w /opt/fits/fits.log

rm -f /opt/fits/tools/mediainfo/linux/libmediainfo.so.0
rm -f rm /opt/fits/tools/mediainfo/linux/libzen.so.0

echo "Done"
