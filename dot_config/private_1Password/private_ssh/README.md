# 1Password Config File

The file `encrypted_private_agent.toml.age` just contains the config for the 1Password SSH-Agent. The real config file is `~/.config/1Password/ssh/agent.toml`. As it contains some sensitive information, I've added it to my chezmoi repo encrypted. This can be done like this:

```shell
chezmoi add --encrypted ~/.config/1Password/ssh/agent.toml
```
Just to give you an idea of what the file contains, here is an example:

```toml
[[ssh-keys]]
vault = "My Vault"
item = "My SSH Key"
```

All information about the 1Password SSH-Agent configuration can be found [here](https://developer.1password.com/docs/ssh/agent/config/).
