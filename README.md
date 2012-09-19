## Import .files

Clone this repo. Will override all local files but .m2/settings.xml.

```
cd ~
git clone https://github.com/jeluard/dotfiles.git
mv dotfiles/*(DN) .  //zsh specific to copy hidden files. Will not copy .m2/ but that's what we want.
rm -rf dotfiles
```

## Save changes

Follow the standard git procedure.

``
git commit ...
git push origin master
``
