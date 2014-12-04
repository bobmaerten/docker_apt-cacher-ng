#!/bin/bash
docker run --name apt-cacher-ng -p 3142:3142 -v /data/apt_cacher:/var/cache/apt-cacher-ng --restart=always -d bobmaerten/apt-cacher-ng
