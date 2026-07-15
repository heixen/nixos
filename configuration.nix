{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_5
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono"]; })
  ];

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  #sway
  # Very important for Wayland greeters / polkit agents / portals to work properly
  security.polkit.enable = true;

  # Enable xdg-desktop-portal (usually already on, but good to be explicit)
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    # or use xdg-desktop-portal-gtk + -wlr if you want both gtk & wlr support
  };

  programs.sway = {
    enable = true;

    # Very useful: makes GTK apps respect themes & scaling better
    wrapperFeatures.gtk = true;

    # Optional: extra session variables (useful for electron apps, java, etc.)
    # extraSessionCommands = ''
    #   export MOZ_ENABLE_WAYLAND=1
    #   export XDG_CURRENT_DESKTOP=sway
    #   export _JAVA_AWT_WM_NONREPARENTING=1
    # '';
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # audio
  security.rtkit.enable = true; # Allows realtime priority (important for audio)

  services.pipewire = {
    enable = true;

    alsa.enable = true; # Support for native ALSA apps
    alsa.support32Bit = true; # Useful for Steam, 32-bit games/apps

    pulse.enable = true; # PulseAudio compatibility layer (most desktop apps use this)

    # Optional extras (uncomment if needed)
    # jack.enable = true;        # For pro audio / JACK apps like Ardour, QjackCtl
    # wireplumber.enable = true; # Usually auto-enabled, but explicit is safe
  };
  hardware.alsa.enablePersistence = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services.gvfs.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.markjake = {
    isNormalUser = true;
    description = "Mark Jake Arzadon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "audio"
    ];
    packages = with pkgs; [
      git
      kitty
      vscode
      mpv
      neovim
      nodejs_24
      postman
      libreoffice
      tree
      #### for waybar
      coreutils
      gawk
      bc
      gnome-calendar
      sweethome3d.application
    ];
  };
  # in configuration.nix
  services.flatpak.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #udiskie?

  services.udisks2.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    #################################################
    # Wayland / Sway
    #################################################
    foot
    wofi
    fuzzel
    swaylock
    swayidle
    wlsunset
    slurp
    grim
    wl-clipboard
    brightnessctl
    waybar
    swww

    #################################################
    # Editors & Documentation
    #################################################
    vim
    man-pages
    linux-manual
    tree-sitter
    #
    lazygit
    fzf
    fd



    #################################################
    # Terminal Utilities
    #################################################
    wget
    curl
    unzip
    ripgrep

    htop
    btop
    fastfetch

    nix-search-cli

    #################################################
    # Development Tools
    #################################################

    # Compilers
    gcc
    clang

    # Build tools
    cmake
    gnumake

    # C/C++
    clang-tools # clangd, clang-format, etc.

    # CMake utilities
    cmake-format
    cmake-lint

    # Python
    pyright
    python3Packages.python-lsp-server

    # Lua & formatter
    lua-language-server
    nixfmt

    #################################################
    # File Management & MTP
    #################################################
    mtpfs
    libmtp

    #################################################
    # KDE / Dolphin Integration
    #################################################
    kdePackages.dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.breeze-icons

    # Thumbnails
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs

    # Network & filesystem integration
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kio-admin

    #################################################
    # Images & Graphics
    #################################################
    kdePackages.gwenview
    sxiv

    #################################################
    # Audio
    #################################################
    pavucontrol
    pwvucontrol
    pamixer
    easyeffects
    alsa-utils

    #################################################
    # Bluetooth
    #################################################
    bluetuith

    #################################################
    # Networking
    #################################################
    nmap

    #################################################
    # others
    #################################################
    gnome-calculator
    cheese
    fd
    cronie

    #################################################
    # cursor
    #################################################
    rose-pine-gtk-theme
    rose-pine-hyprcursor
    rose-pine-cursor
    rose-pine-icon-theme
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  documentation.man.cache.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}



