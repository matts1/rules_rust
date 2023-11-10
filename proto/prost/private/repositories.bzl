"""Dependencies for Rust Prost rules"""

load("//proto/prost:repositories.bzl", _rust_prost_dependencies = "rust_prost_dependencies")
load("//proto/prost/private/3rdparty/crates:crates.bzl", "crate_repositories")

def rust_prost_dependencies(bzlmod = False):
    """Prost repository dependencies."""
    direct_deps = crate_repositories()

    direct_deps.extend(_rust_prost_dependencies(bzlmod = bzlmod))
    return direct_deps

# buildifier: disable=unnamed-macro
def rust_prost_register_toolchains(register_toolchains = True):
    """Register toolchains for proto compilation.

    Args:
        register_toolchains (bool, optional): Whether or not to register the default prost toolchain.
    """

    if register_toolchains:
        native.register_toolchains(str(Label("//proto/prost/private:default_prost_toolchain")))
