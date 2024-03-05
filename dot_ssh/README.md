# Allowed Signers

You need to allow all your ssh public keys for signing git commits. To do so, you can add them under `~/.ssh/allowed_signers`.

The format looks like this:

```shell
your@email.com namespaces="git" {algorithm like ssh-rsa or ssh-ed25519} {your key} {your keys comment}
```

More info on this can be found [here](https://docs.gitlab.com/ee/user/project/repository/signed_commits/ssh.html).

Then you need to add this file to your chezmoi repo by running:

```shell
chezmoi add --encrypted ~/.ssh/allowed_signers
```
Its your choice to encrypt this file or not.
