{ pkgs ? import ./nix/pinnedNixpkgs.nix }:

with pkgs;

let

  bazel = callPackage ./nix/bazel.nix  {};
  bazel-darwin = callPackage ./nix/bazel-darwin.nix {
    bazelVersion = bazel.version;
  };

in

stdenv.mkDerivation {

  # TODO: fix darwin (Issue #4990). Currently, darwin build does not work with bazel.nix.
  buildInputs = (if stdenv.isDarwin
                   then [
                     # jre here due to being unable to get
                     # propagation working from bazel-darwin
                     pkgs.jre
                     bazel-darwin
                   ] else [
                     bazel
                   ])
                ++ [
                     # general
                     # circleci-cli # not in our pinned version
                     git
                     # haskell build (plus bazel, above)
                     binutils
                   ];

  name = "bazel-brush";
}
