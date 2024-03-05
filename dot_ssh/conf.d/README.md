# Custom ssh config files

Place any custom ssh config files here

I am using them to be able to ssh into servers by only using a shortcut, like this:

```
ssh server1
```

To do so, place the following config into a file named as you like (I use `private` for my private servers and company for the ones I need at work for example) and place it in this directory (dot_ssh/conf.d/):

```
Host server1
    User ubuntu
    Host 192.168.1.10
    IdentityFile ~/.ssh/id_ed25519
```

As this may contain info you don't want to share, you may want to encrypt these files. To do so, you can add them to your chezmoi repo by running:

```
chezmoi add --encrypt ~/.ssh/conf.d/private-servers
```
