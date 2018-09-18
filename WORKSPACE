workspace(name = "bazel_brush")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//bzl:repo_utils.bzl", "github_http_archive")
load("//bzl:cc_configure_custom.bzl", "cc_configure_custom")

github_http_archive(
  name = "io_tweag_rules_nixpkgs",
  project = "rules_nixpkgs",
  sha = "896c2d96a70a408c545cc491974068c36f507009",
  user = "tweag",
)

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_git_repository", "nixpkgs_package")

nixpkgs_git_repository(
  name = "nixpkgs",
  revision = "ee80654b5267b07ba10d62d143f211e0be81549e",
)

github_http_archive(
  name = "io_tweag_rules_haskell",
  project = "rules_haskell",
  sha = "edcd7c107d49ba69c96fe625161c42d4e5610d30",
  user = "tweag",
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

github_http_archive(
  name = "ai_formation_hazel",
  project = "hazel",
  sha = "925293994f88799ba550fd5cf3995104d1f2972c",
  user = "FormationAI",
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")

haskell_repositories()

nixpkgs_package(
    name = "c2hs",
    attribute_path = "haskell.packages.ghc822.c2hs",
    repository = "@nixpkgs",
)

nixpkgs_package(
  name = "ghc",
  attribute_path = "haskell.packages.ghc822.ghc",
  build_file = "//:BUILD.ghc",
  repository = "@nixpkgs",
)

nixpkgs_package(
    name = "compiler",
    nix_file = "//:nix/compiler.nix",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "glibc",
    attribute_path = "glibc",
    repository = "@nixpkgs",
)

register_toolchains(
  "@ghc//:ghc",
  "//:doctest-toolchain",
)

nixpkgs_package(
    name = "gcc-unwrapped.lib",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@platform_core//bzl:repo_utils.bzl", "patched_solib")
patched_solib(name="patched_cpp", lib_name="stdc++")
""",
    repository = "@nixpkgs",
)

load("//bzl:packages.bzl", "core_packages", "packages")

load(
    "@ai_formation_hazel//:hazel.bzl",
    "hazel_custom_package_github",
    "hazel_custom_package_hackage",
    "hazel_repositories",
)

hazel_repositories(
  core_packages = core_packages,
  packages = packages,
  exclude_packages = [
    "ghc-paths",
  ],
  extra_libs = {
        "stdc++": "@gcc-unwrapped.lib//:patched_cpp",
        "c++": "@gcc-unwrapped.lib//:patched_cpp",
    },
)

hazel_custom_package_hackage(
    package_name = "ghc-paths",
    version = "0.1.0.9",
)
