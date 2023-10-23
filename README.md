# My personal dotfiles

My personal dotfiles. I use [chezmoi](https://www.chezmoi.io/) to manage them.

```
|-- bin
|-- config
|-- dot_oh-my-zsh
|   `-- custom
|-- dot_ssh
|-- dot_vim
|-- git-hooks
|-- git-template
|   `-- hooks
|-- install
|-- macos
|-- misc
`-- shell
```

## Features

- **Automated Installation of Essential Tools**: Defined in the `Brewfile`, inclusive of:
  - CLI tools optimized for iTerm
  - ZSH Plugins
  - Database Systems: MySQL, Redis
  - Web Servers: Nginx
  - Containerization: Docker
  - Font Packages
  - QuickLook Plugins
  - Applications: 1Password, Telegram, Discord, and more.
- **Shell Setup**: Configures zsh for iTerm, enhancing the terminal experience.
- **Included Aliases and Functions**: A collection of useful shortcuts and functions for improved workflow.
- **Git Configuration**: Sets up a secure and personalized Git environment, including commit signing and other preferences.

## Install

**Please Fork the Repo before use it!**

Run the following command in your home directory to install them:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh {your github user name}
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
