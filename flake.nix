{
  description = "EncryptOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let
    user = "Encryptomant";

    hosts = [
      { hostname = "EncryptOS"; stateVersion = "25.05"; }
    ];

    build = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs user hostname stateVersion; };

      modules = [
        ./hosts/${hostname}
        ./nixos/modules

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.fileBackupExtension = "bak";
          home-manager.users.${user} = ./home-manager/home.nix;
        }
      ];
    };
  in

  {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = build { inherit (host) hostname stateVersion; };
    }) hosts);
  };
}
