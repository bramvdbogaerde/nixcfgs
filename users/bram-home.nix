{ config, pkgs, ...}:

let nixpkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/master.tar.gz) {} ; in 
{
  programs.home-manager.enable = true;

  home.username = "bram";
  home.homeDirectory = "/home/bram";

  home.packages = with pkgs; [
    ngrok-1
    dfeet
    any-nix-shell
    appimage-run
    arandr
    bind
    chromium
    cifs-utils
    cmake
    nixpkgs.discord
    evince
    feh
    ffmpeg-full
    file
    flameshot
    font-awesome
    gnome3.gedit
    gnome3.ghex
    gnumake
    gnupg
    htop
    i3status-rust
    inotify-tools
    insomnia
    k9s
    killall
    kubectl
    lsof
    mpv
    mumble
    mypaint
    gnome3.nautilus
    neofetch
    nfs-utils
    nodejs
    openjdk
    pavucontrol
    powerline-fonts
    racket-minimal
    ranger
    remmina
    rofi
    rustscan
    samba
    slack
    sonic-pi
    spotify
    steam
    tcpdump
    teams
    thunderbird
    tigervnc
    tmux
    tree
    unzip
    virt-manager
    whois
    qt4
    xclip
    xorg.xev
    xorg.xmodmap
    zip
    zoom-us
    dejavu_fonts
  ];

  programs.git = {
    enable = true;
    userName = "bramvdbogaerde";
    userEmail = "contact@bramvdb.com";
  };

  programs.go = {
    enable = true;
    goPath = "/home/bram/data/development/go/";
  };

  programs.neovim = {
     enable = true;
     vimAlias = true;
     withNodeJs = true;
     plugins = with nixpkgs.vimPlugins ; [
        # UI
        nerdtree
        vim-airline
        ctrlp-vim

        # Color Schemes
        gruvbox

        # IDE features
        coc-nvim

        # Languages
        Coqtail
        vim-nix
        rust-vim
        vim-scala
        idris-vim
        vim-elixir
        vim-yaml
      ];

      extraConfig = ''
        let g:coc_global_extensions = ["coc-tsserver", "coc-json", "coc-metals", "coc-rls"]
        colorscheme gruvbox
        let g:airline_poweraline_fonts = 1
        map <C-d> :NERDTreeToggle<CR>
        let g:ctrlp_custom_ignore = 'vendor\|pkg\|node_modules\|build\|target'
        let g:ctrlp_use_caching = 0

        set shiftround  " Round indent to multiple of 'shiftwidth'
        set smartindent " Do smart indenting when starting a new line
        set autoindent  " Copy indent from current line, over to the new line
        set expandtab
        set shiftwidth=3
        set softtabstop=3
      '' + (builtins.readFile ./nvim/coc-mappings.vim);
  };

  home.stateVersion = "21.03";
}
