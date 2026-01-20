return {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog"
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✔️",
                package_pending = "🕓",
                package_uninstalled = "❌"
            }
        }
    }
}
