{ config, pkgs, ...}:

{
  programs.home-manager.enable = true;

  home.username = "bram";
  home.homeDirectory = "/home/bram";

  home.packages = with pkgs; [
    dfeet
    any-nix-shell
    appimage-run
    arandr
    bind
    chromium
    cifs-utils
    cmake
    discord
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


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
