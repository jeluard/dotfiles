#!/bin/sh

#Backup photos
rsync -azP --delete --progress /Volumes/Capsulette/iPhoto\ Library/Masters/ /Volumes/Disquette/Photos/
