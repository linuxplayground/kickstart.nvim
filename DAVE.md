# Instructions for this kickstart

These are my personal instructions for things that have to be done in addition
to this kickstart to get neovim working as I want.

- `sudo apt install ripgrep`
- `git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig`
- Mason: Install these plugins
  - ansible-language-server ansiblels
  - ansible-lint
  - cfn-lint
  - lua-language-server lua_ls
  - markdownlint-cli2
  - stylua

## Install on Raspbery PI

There is no Neovim package for the Raspberri PI - Well at least not a recent
one.

As of 12/08/2024 - the version on neovim on raspberry pi apt packages is:
neovim/stable 0.7.2-7 arm64

These are the instructions to build it from source.

```shell
sudo apt-get install git
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
