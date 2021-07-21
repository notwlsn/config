# My Dotfiles
Not my full setup, slowly adding the bigger files. Free for anyone to use, and some of these are forked from people who are credited in the file comments

### Usage

**Disclaimer**:
Don't use the install script right now. I need to figure some things out. It's become less of a dotfile install and more of an Ansible playbook, and frankly I need to separate responsbilities between the two and rewrite them. For now, don't use it.

Run `install.sh` and the bash, tmux, and vim config files will be installed, backing up your old ones to *_old in the working directory.

### TODO
~~- Slowly add other stuff like i3gaps and full nvim/vim (with plugins) configs~~
- ~~Create `install.sh`~~
- Update README with list of files
- Rewrite installation scripts
- Create Terraform & Ansible manifest(s)

#### What is Brew?
Homebrew, a Mac package manager, see [here.](https://brew.sh/ "Homebrew website") The `brew/casks` directory here are all of the Brew packages I have installed, and the `brew/leaves` directory are all (some) of the Bash utilities I have installed. Running `dump.sh` will dump the packages you have installed in the same format if you're on a Mac.
