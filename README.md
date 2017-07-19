# Install

```
git clone git://github.com/jeluard/dotfiles.git ~/Documents/Projects/dotfiles
./install.sh
chsh -s $(which zsh)
```

# GPG keys

## Go offline

If you have a Yubikey read https://github.com/drduh/YubiKey-Guide and install necessary packages.

## Install tails (optional)

Follow https://tails.boum.org/install/.

## Generate keys
./gpg-gen-keys.sh

## Publish key
```
gpg --send-keys $GPG_KEY_ID
```

## Git setup

```
# Configure git to sign commits, tags and pushes
# https://git-scm.com/book/tr/v2/Git-Tools-Signing-Your-Work
git config --global user.signingKey ${GPG_KEY_ID}
git config --global commit.gpgSign true
git config --global tag.gpgSign true
git config --global push.gpgSign false # not yet supported by github


# Can be verified with `git tag --verify [signed-tag-name]`
# Verify signatures when merging: `git merge --verify-signatures`
git log --show-signature
git verify-commit
git show HEAD --show-signature
git config --help # to list all available options
```

### FAQ

If you have some error messages when signing related to ioctl make sure you execute `export GPG_TTY=$(tty)`.
If you move your subkey to a Yubikey you will have to import the public key (see [here](https://gpgtools.tenderapp.com/kb/gpg-keychain-faq/gpg-keychain-not-showing-key-from-smart-card)).
Note that you can generate your key directly on the Yubikey (see [here](https://www.yubico.com/support/knowledge-base/categories/articles/use-yubikey-openpgp/#generateopenpgp)).


## Web of trust
Have others sign your key and reimport it back

```
gpg --sign-key eliasen@mindspring.com
gpg --export --armor their@email.address
gpg --import
```


TODO use gpg/ssh bridge

## Sources

* https://github.com/drduh/YubiKey-Guide
* https://gist.github.com/abeluck/3383449
* https://malcolmsparks.com/posts/yubikey-gpg.html
* https://www.esev.com/blog/post/2015-01-pgp-ssh-key-on-yubikey-neo/
* https://www.g-loaded.eu/2010/11/01/change-expiration-date-gpg-key/
* https://askubuntu.com/questions/635266/use-of-yubikey-neo-for-login-2fa-and-lock-screen