# My Dotfiles
This is not my full setup, I'm slowly adding the bigger files. Free for anyone to use. Questions can be sent to `tsunset@proton.me`.

## Usage

Coming soon. Going to write a simple script to use these via symlink. It's far cleaner than actually moving physical files to your dotfile locations, and it'll allow a lot more flexibility for testing out other people's configs.

## TODO
- ~~Slowly add other stuff like i3gaps and full nvim/vim (with plugins) configs~~
- ~~Create `install.sh`~~
- ~~Write about bitmap fonts & using them on Ubuntu~~
- Update README with list of files
- ~~Rewrite installation scripts~~

## HomeBrew
### What is Brew?
Homebrew, a Mac package manager, see [here.](https://brew.sh/ "Homebrew website") The `brew/casks` directory here are all of the Brew packages I have installed, and the `brew/leaves` directory are all (some) of the Bash utilities I have installed. Running `dump.sh` will dump the packages you have installed in the same format if you're on a Mac.

### Why did you remove brew?
While I did want to show people the packages that are handy for me in brew, giving someone a package listing of my laptop just feels like awful security practice. I might bring this back at a later time if I can find a better way of doing it.

## Bitmap fonts
### What are bitmap fonts?
There are three formats of computer fonts: 
- **Vector** - Use [parametric curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) and formulae to outline a symbol, which is then created in real time. This makes them scalable to any size.
- **Stroke** - Size and shape are defined using metadata specifications which create the font/symbol.
- **Bitmap** - Pixels are arranged in a literal bitmap (array of binary data which represents pixel values) for a given size. This means they are not scalable and a separate file must be present for each font at a given size.

Here's an example of the [Terminus](http://terminus-font.sourceforge.net/) bitmap font on Ubuntu:

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

This would look something like:

```
$ cp new_font.otb /usr/local/share/fonts
$ dpkg-reconfigure fontconfig-config
$ dpkg-reconfigure fontconfig
$ fc-cache -fv
```

### Terminus via Installer
There's another way to do this as well. The nice people making Terminus have an installer. You can find it on their page (linked above), or directly from [SourceForge](https://sourceforge.net/projects/terminus-font/files/terminus-font-4.49/terminus-font-4.49.1.tar.gz/download).

Install from source by extracting the tarball and `make` then `make install` in the build directory. This installer should provide accomodating options for differing file formats too.
