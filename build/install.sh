#!/bin/sh
set -e

PACKAGE_DIR="/kitchen/pkg"

## This
##
setup_kitchen_in_kitchen(){
  echo "*** Setup kitchen in kitchen for testing ***"

  ## setup a vagrant binary to print version
  printf '#!/bin/sh\necho "Vagrant 1.8.6"\n' | sudo tee /bin/vagrant > /dev/null
  sudo chmod +x /bin/vagrant

  ## Setup a docker binary to exit 0
  printf "#!/bin/sh\n exit 0\n" | sudo tee /bin/docker > /dev/null
  sudo chmod +x /bin/docker

  ## Setup kitchen_in_kitchen dir
  cp -r /kitchen/test/kitchen_in_kitchen/ /tmp
}

if [ ! -d "${PACKAGE_DIR}" ]; then
  echo "Packages dir '${PACKAGE_DIR}' not found"
  exit 1
fi

if [ -e /etc/os-release ]; then
  . /etc/os-release
fi

if [ "${NAME}" = 'Ubuntu' ]; then
  echo "Installing kitchen deb package $(ls ${PACKAGE_DIR}/kitchen_*.deb)"
  sudo dpkg -i ${PACKAGE_DIR}/kitchen_*.deb
else
  echo Unknown OS detected.
  exit 1
fi

## Use for testing
setup_kitchen_in_kitchen
