~~### notes~~
~~this is my neovim nix config using mnw (minimal neovim wrapper).~~

~~ive made the design architecture idiomatic to normal neovim, so the root directory of this project is AS IF one was in .config/nvim~~
~~this is much more preferable to mnw's way of handling things. this leads to calling an init.lua at the root, having a lua/ folder at the root, etc.~~

~~### installation~~
~~to run this config, use ``nix run github:re3quisitevariety:nvim-nix-dots``. you can also use ``nix profile install``, or add the configuration to your configuration.nix/home manager~~

---

okay, im not using nix and going raw neovim for now, eventually plan to make a pretty nix wrapper but for now we keep it simple.

i think choosing to do the nix way of things as fucked with my head too much. gotta learn how to iterate faster and when, instead of clouding myself in paralysis by analysis trying to be everything. 

sometimes you do just have to start out inefficient.

big tasks:
- lsps, treesitter, etc.
- obsidian

maybe ill just add a neovim module in my nixos dotfiles

things ill keep in mind for the wrapper:
- fzf, fd, ripgrep (for telescope)
