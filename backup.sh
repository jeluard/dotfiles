#!/bin/sh

#Backup photos
rsync -azP --delete --progress Capsulette/iPhoto\ Library/Masters/ Disquette/Photos/
