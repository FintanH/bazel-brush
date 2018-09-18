load(
    "@io_tweag_rules_haskell//haskell:haskell.bzl",
    "haskell_doctest",
    "haskell_library",
)
load("@ai_formation_hazel//:hazel.bzl", "hazel_library")

haskell_library(
  name = "documentation",
  srcs = glob(["src/**/*.hs"]),
  src_strip_prefix = "src",
  visibility = ["//visibility:public"],
  deps = [
      hazel_library("base"),
      hazel_library("text"),
  ],
)

haskell_doctest(
    name = "doctest",
    doctest_flags = [
        "--fast",
        "-fobject-code",
    ],
    modules = ["DocumentAbove", "DocumentBelow"],
    deps = [":documentation"],
)
