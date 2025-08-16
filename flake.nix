{
  description = "EncryptOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, disko, ... } @inputs:
  let
    user = "Encryptomant";

    hosts = [
      { hostname = "EncryptOS"; system = "x86_64-linux"; stateVersion = "25.05"; }
    ];

    build = { hostname, system, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs user hostname stateVersion; };

      modules = [
        ./hosts/${hostname}
        ./nixos/modules

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.${user} = ./home-manager/home.nix;
          home-manager.extraSpecialArgs = { inherit user stateVersion; };
        }
      ];
    };
  in

  {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = build { inherit (host) hostname system stateVersion; };
    }) hosts);
  };
}
