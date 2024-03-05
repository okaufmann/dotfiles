# Folder based git configs

In the .gitconfig file located at $(chezmoi source-path)/config/.gitconfig, the following lines are included:

```ini
[include]
    path = ~/.git-config/.gitconfig-private

[includeIf "gitdir:~/Code/_work/"]
    path = ~/.git-config/.gitconfig-work
```

I utilize distinct git configurations for my work projects located in ~/Code/_work/ to accommodate a separate email address specific to my work-related activities.

The user properties within the two git config files are defined as follows:

```ini
[user]
    signingKey = ~/.ssh/id_ed25519.pub
    email = my@email.com
    name = My Name
```

To minimize the dissemination of information, I've encrypted and added the two git config files to my chezmoi repository in the following manner:

```shell
chezmoi add --encrypted ~/.git-config/.gitconfig-private
chezmoi add --encrypted ~/.git-config/.gitconfig-work
```
