## Import .files

Create a git repo in home then import files.

```
cd ~
git remote add --track master origin https://github.com/jeluard/dotfiles.git
git fetch
git add .
```

## Save changes

Follow the standard git procedure.

``
git commit ...
git push origin master
``
