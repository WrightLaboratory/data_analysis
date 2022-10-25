#! /usr/bin/env bash

# UID and GUID of `jovyan` user context in running image
uid=1000
gid=100
subuidSize=$(( $(podman info --format "{{ range .Host.IDMappings.UIDMap }}+{{.Size }}{{end }}" ) - 1 ))
subgidSize=$(( $(podman info --format "{{ range .Host.IDMappings.GIDMap }}+{{.Size }}{{end }}" ) - 1 ))


#podman run -it --rm -p 8888:8888 \
#    -v "$(pwd)":/home/jovyan --user $uid:$gid \
#    --uidmap $uid:0:1 --uidmap 0:1:$uid --uidmap $(($uid+1)):$(($uid+1)):$(($subuidSize-$uid)) \
#    --gidmap $gid:0:1 --gidmap 0:1:$gid --gidmap $(($gid+1)):$(($gid+1)):$(($subgidSize-$gid)) \
#    -e JUPYTER_ENABLE_LAB=yes \
#    --name 'wl-jupyter-lab' \
#   jupyter/scipy-notebook:latest

podman run -it --rm -p 8888:8888 \
    --user $uid:$gid \
    --uidmap $uid:0:1 --uidmap 0:1:$uid --uidmap $(($uid+1)):$(($uid+1)):$(($subuidSize-$uid)) \
    --gidmap $gid:0:1 --gidmap 0:1:$gid --gidmap $(($gid+1)):$(($gid+1)):$(($subgidSize-$gid)) \
    -v "$(pwd)":/home/jovyan  \
    -e JUPYTER_ENABLE_LAB=yes \
    --name 'wl-jupyter-lab' \
   jupyter/scipy-notebook:latest

