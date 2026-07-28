Folder structure:

```
nixos-config

├── flake.nix

├── hosts

│   ├── x99-tf (hostname)

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

    ├── chicoarun (username)

    │     └──home.nix

    └── ... (username)
```
