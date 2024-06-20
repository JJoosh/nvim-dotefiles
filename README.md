# nvim-dotefiles
This repository contains the files needed by NVIM to use and customize NVIM.

### NVIM Version
* nvim 0.10.0

### Update your system

```bash
sudo apt update && sudo apt upgrade -y
```

## How to install

### Auto

```bash
git clone https://github.com/JJoosh/nvim-dotefiles
cd nvim-dotefiles
chmod +x install.sh
./install.sh
```

## Option Manually

#### Step 3: Create the Neovim configuration directory
Create the Neovim configuration directory if it doesn't exist:

``` bash
mkdir -p ~/.config/nvim
```

#### Step 4: Create the init.vim file
Create the init.vim file in the Neovim configuration directory:
``` bash
nano ~/.config/nvim/init.vim
```
* NOTE: Copy and paste the init.vim into yours

#### Step 5: Create the `coc-settings.json` file
```bash
nano ~/.config/nvim/coc-settings.json
```
* NOTE: Copy and paste the coc-settings.json into your own

#### Step 6: Install vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Step 7: Install Neovim plugins

```bash
nvim +PlugInstall +qall
```

> If you did everything right you should get something like this

![image](https://github.com/JJoosh/nvim-dotefiles/assets/122099216/90a6e3fe-f034-4e2d-9fda-22c89ddf8fba)


#### Remember these are my files of how I configured it, you can move them and change themes and shortcuts to whatever you like.
