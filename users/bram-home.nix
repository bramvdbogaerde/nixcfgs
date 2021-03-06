{ config, pkgs, ...}:

let nixpkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/master.tar.gz) {} ;
    ambienttalk = import ./nvim/ambienttalk-plugin.nix ; in 
{
  programs.home-manager.enable = true;
  programs.termite.enable = true;
  programs.termite.font = "Monospace 14";
  programs.termite.backgroundColor = "rgba(63, 63, 63, 0.8)";

  home.username = "bram";
  home.homeDirectory = "/home/bram";

  home.packages = with pkgs; [
    ngrok-1
    keepassxc
    dfeet
    any-nix-shell
    appimage-run
    arandr
    playerctl
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
    vscode
    gnome3.gedit
    gnome3.ghex
    gnumake
    gnupg
    htop
    libreoffice
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
    racket
    ranger
    remmina
    rofi
    rustscan
    samba
    slack
    sonic-pi
    nixpkgs.spotify
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
        vimtex
        (ambienttalk {})
      ];

      extraConfig = ''
        let g:coc_global_extensions = ["coc-tsserver", "coc-json", "coc-metals", "coc-rls", "coc-vimtex" ]
        colorscheme gruvbox
        let g:airline_poweraline_fonts = 1
        map <C-d> :NERDTreeToggle<CR>
        nmap <leader>ef :CocFix<CR>
        nmap <silent> <leader>en <Plug>(coc-diagnostic-next-error)

        let g:ctrlp_custom_ignore = 'vendor\|pkg\|node_modules\|build\|target'
        let g:ctrlp_use_caching = 0

        set shiftround  " Round indent to multiple of 'shiftwidth'
        set smartindent " Do smart indenting when starting a new line
        set autoindent  " Copy indent from current line, over to the new line
        set expandtab
        set shiftwidth=3
        set softtabstop=3
        filetype plugin on

        let g:iat_binary_location = "/home/bram/.local/bin/iat"
      '' + (builtins.readFile ./nvim/coc-mappings.vim);
  };

  services.syncthing.enable = true;
  services.syncthing.tray = true;

  home.stateVersion = "21.03";
}
