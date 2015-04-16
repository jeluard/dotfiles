#!/bin/sh

#Backup photos
rsync -azP --delete --progress /Volumes/Capsulette/Photos/ /Volumes/Disquette/Photos/
