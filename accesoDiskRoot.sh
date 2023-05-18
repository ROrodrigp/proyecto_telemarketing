#!/bin/bash

echo "consultando accesos actuales"
ls -lh /dev/sd*
ls -lh /dev/nvme0n*

echo "asignando accesos"

chown grid:asmdba /dev/sd*
chown grid:asmdba /dev/nvme0n2
chown grid:asmdba /dev/nvme0n3
chmod 770 /dev/sd*
chmod 770 /dev/nvme0n2
chmod 770 /dev/nvme0n3

echo "consultando accesos asignados"
ls -lh /dev/sd*
ls -lh /dev/nvme0n*


