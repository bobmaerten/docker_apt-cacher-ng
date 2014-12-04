# apt-cacher-ng

Starts a apt_proxy server to use from dockerhost or from running containers

## Usage

Start the container with:

    docker run --name apt-cacher-ng -p 3142:3142 -d bobmaerten/apt-cacher-ng

Feel free to use the `--restart=always` switch in order to have it always running on your laptop at boot for instance.

Then add in your local configuration (or Dockerfile)

    DOCKERHOST=$(LANG=C ifconfig docker0 | grep "inet addr" | awk '{print $2}' | cut -f2 -d:)
    echo "Acquire::http { Proxy \"http://${DOCKERHOST}:3142\"; };"  > /etc/apt/apt.conf.d/01proxy

You should be able to fetch and hold packages from `apt-get`/`aptitude` commands, but be sure to watch your filesystem grow rate!

## Persistance of fetched packages

Just mount a directory using previous command

    docker run --name apt-cacher-ng -p 3142:3142 -v /data/apt_cacher:/var/cache/apt-cacher-ng -d bobmaerten/apt-cacher-ng
