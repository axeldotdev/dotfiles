<p align="center"><img src="https://banners.beyondco.de/Axeldotdev's%20Dotfiles.png?theme=light&packageManager=&packageName=axeldotdev%2Fdotfiles&pattern=topography&style=style_1&description=Install+your+Macbook+from+A+to+Z&md=1&showWatermark=1&fontSize=100px&images=clipboard-list"></p>

## Introduction

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

My dotfiles are massively inspired from [Dries Vints](https://github.com/driesvints)!

## A Fresh macOS Setup

These instructions are for setting up new Mac devices.

### Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/axeldotdev/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:axeldotdev/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```

5. Start `Herd.app` and run its install process
6. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
7. Restart your computer to finalize the process

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the reference in the [`.zshrc`](./.zshrc#L2) file.

### Cleaning your old Mac (optionally)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to [backup your data](#backup-your-data) first!

### Explanations

This repository contains some cool files!

- **.gitignore_global** make sure some files and folders are excluded, even if your projet don't have a .gitignore file
- **ssh.sh** helps you create your SSH keys if you don't have one
- **aliases.zsh** list some usefull (and less usefull) commands
- **path.zsh** manage the $PATH variable of your Mac
- **minimal.zsh-theme** is a simple but cool theme for your terminal
- **Brewfile** list all the applications to install via Brew
- **.macos** configure your Mac
- **.zshrc** is your Shell settings file, it's symlink to your Mac user
- **fresh.sh** install the all thing
- **vscode/** contains the settings and keybindings json files and list extensions
