# My personal dotfiles

My personal dotfiles. I use [chezmoi](https://www.chezmoi.io/) to manage them.

**Please Fork the Repo before use it!**

Run the following command in your home directory to install them:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh {your user name}
```

Feel free to create an issue on this repo if you have any questions about them.

![screenshot](https://okaufmann.github.io/dotfiles/screenshot.png)

## Update

    chezmoi status
    chezmoi diff
    chezmoi update

## Edit a file

    chezmoi edit ~/.ssh/config

## Problems

chezmoi doctor
