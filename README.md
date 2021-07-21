# My Dotfiles
This is not my full setup, I'm slowly adding the bigger files. Free for anyone to use.

## Usage

**Disclaimer**:
Don't use the install script right now. I need to figure some things out. It's become less of a dotfile install and more of an Ansible playbook, and frankly I need to separate responsbilities between the two and rewrite them. For now, don't use it.

Run `install.sh` and the bash, tmux, and vim config files will be installed, backing up your old ones to *_old in the working directory.

## TODO
- ~~Slowly add other stuff like i3gaps and full nvim/vim (with plugins) configs~~
- ~~Create `install.sh`~~
- ~~Write about bitmap fonts & using them on Ubuntu~~
- Update README with list of files
- Rewrite installation scripts
- Create Terraform & Ansible manifest(s)

## HomeBrew
### What is Brew?
Homebrew, a Mac package manager, see [here.](https://brew.sh/ "Homebrew website") The `brew/casks` directory here are all of the Brew packages I have installed, and the `brew/leaves` directory are all (some) of the Bash utilities I have installed. Running `dump.sh` will dump the packages you have installed in the same format if you're on a Mac.

## Bitmap fonts
### What are bitmap fonts?
There are three formats of computer fonts: 
- **Vector** - Use [parametric curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) and formulae to outline a symbol, which is then created in real time. This makes them scalable to any size.
- **Stroke** - Size and shape are defined using metadata specifications which create the font/symbol.
- **Bitmap** - Pixels are arranged in a literal bitmap (array of binary data which represents pixel values) for a given size. This means they are not scalable and a separate file must be present for each font at a given size.

Here's an example of the Terminus bitmap font on Ubuntu:

![terminus-ubuntu.png](/bitmap-font.png)

### I don't care - I just want it
This will differ by distribution. For now I'm only posting about Ubuntu 20.04, because it's what I use. This should work for any Ubuntu version past 11.10, but perform at your own risk.

Ubuntu disables support for bitmap fonts by default, so you have to manually enable it. Also, fonts have to be in [OTB](https://en.wikipedia.org/wiki/OpenType) format.

Enable them by removing `70-no-bitmaps.conf` and re-linking `70-force-bitmaps.conf` in `/etc/fonts/conf.d`. Then reconfigure `fontconfig` with `dpkg`. This will go something like:

```
$ rm /etc/fonts/conf.d/70-no-bitmaps.conf
$ ln -s ../conf.avail/70-force-bitmaps.conf /etc/fonts/conf.d
$ dpkg-reconfigure fontconfig-config
$ dpkg-reconfigure fontconfig
```

### I only have a BDF/PCF font...
If all you have a BDF font files they will need to be converted. PCF files cannot be converted to OTB without ending up with some wierd sizing and rendering issues. In that scenario see if you can find an OTB or BDF alternative.

You can use `fonttosfnt` to convert the files. On Ubuntu 20.04 specifically `fonttosfnt` is weirdly [buggy](https://bugs.gentoo.org/728308), so I'd install it straight from the xorg source. See [here](https://gitlab.freedesktop.org/xorg/app/fonttosfnt) for source.

You can convert with:

```
./fonttosfnt -b -c -g 2 -m 2 -o new_font.otb old_font.bdf
```

Once it's in `.otb` format move it to `/usr/local/share/fonts` and use `dpkg` to reconfigure `fontconfig-config`.
