{
	description = "Checked public static website for Mecha Validate";
	inputs.nixpkgs.url = "github:NixOS/nixpkgs/4bd9165a9165d7b5e33ae57f3eecbcb28fb231c9";
	outputs = { self, nixpkgs }:
		let
			systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
			forSystems = nixpkgs.lib.genAttrs systems;
		in {
			packages = forSystems (system:
				let pkgs = import nixpkgs { inherit system; };
				in rec {
					website = pkgs.stdenvNoCC.mkDerivation {
						pname = "validate-website";
						version = "2026-09-12";
						src = self;
						strictDeps = true;
						nativeBuildInputs = [ pkgs.luajit pkgs.findutils pkgs.iconv ];
						dontBuild = true;
						doCheck = true;
						checkPhase = "bash ./test";
						installPhase = ''
							mkdir -p "$out"
							cp -R public/. "$out/"
						'';
					};
					default = website;
				});
			checks = forSystems (system: { website = self.packages.${system}.website; });
			devShells = forSystems (system:
				let pkgs = import nixpkgs { inherit system; };
				in { default = pkgs.mkShell { packages = [ pkgs.bash pkgs.luajit pkgs.findutils pkgs.gnused pkgs.gnutar pkgs.coreutils pkgs.git pkgs.iconv ]; }; });
		};
}
