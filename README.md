Folder structure:

```
nixos-config

├── flake.nix

├── hosts

│   ├── nixos (Your Hostname)

│   │     ├── configuration.nix

│   │     └── hardware-configuration.nix

│   └── ... (hostname)

├── modules

│   ├── nixos (nixos modules)

│   │     ├── common.nix

│   │     ├── niri.nix

│   │     ├── noctalia.nix

│   │     └── ...

│   └── home-manager (home-manager modules)

│         └── base.nix

└── home

    ├── arys (Your Username)

    │     └──home.nix

    └── ... (username)
```
