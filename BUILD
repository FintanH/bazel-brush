load(
    "@io_tweag_rules_haskell//haskell:haskell.bzl",
    "haskell_doc",
    "haskell_doctest_toolchain",
    "haskell_proto_toolchain",
)
load(
    "@ai_formation_hazel//:hazel.bzl",
    "hazel_library",
)

exports_files([
    "packages.bzl",
])

haskell_doctest_toolchain(
    name = "doctest-toolchain",
    doctest = "@haskell_doctest//:doctest_bin",
)

# Setting for indicating that we're building with `-c opt`
config_setting(
    name = "opt",
    values = {
        "compilation_mode": "opt",
    },
)
