# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
pkgs.php83
pkgs.php83Packages.composer
pkgs.nodejs_18
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
           # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
           # and show it in IDX's web preview panel
           command = [
            "npm"
            "run"
            "dev"
            "--"
            "--port"
            "$PORT"
            "--host"
            "0.0.0.0"
           ];
           manager = "web";
           env = {
             # Environment variables to set for your server
             PORT = "$PORT";
           };
         };
      };
    };
  };
}
