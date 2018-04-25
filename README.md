# tmux-plugin-ip
tmux plugin showing IP number

**please note**: this script is adjusted to my personal laptop and OS (ThinkPad T470s, Ubuntu 17.10) and **may not** work in other configurations. Feel free to adjust it to your needs.

Installation
------------
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'pwittchen/tmux-plugin-ip'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

Usage
-----

In order to see IP number of the current computer via this tmux plugin, add the following command to your `.tmux.conf` file:

```
#{ip}
```

References
----------
- https://github.com/tmux-plugins
- https://github.com/tmux-plugins/tmux-example-plugin
- https://github.com/tmux-plugins/tmux-battery
- https://github.com/pwittchen/dotfiles
