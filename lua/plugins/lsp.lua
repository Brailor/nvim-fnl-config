-- [nfnl] fnl/plugins/lsp.fnl
local lsps = {"clojure_lsp", "lua_ls", "jsonls", "yamlls", "marksman", "html", "basedpyright", "ts_ls", "dockerls", "bashls", "taplo", "sqlls"}
local filetype__3eformatters = {lua = {"stylua"}, sh = {"shfmt"}, python = {"ruff_organize_imports", "ruff_format"}, clojure = {"cljfmt"}, javascript = {"prettierd"}, typescript = {"prettierd"}, jsx = {"prettierd"}, html = {"prettierd"}, css = {"prettierd"}, yaml = {"prettierd"}, markdown = {"prettierd"}, fennel = {"fnlfmt"}, sql = {"sqlfmt"}, ["*"] = {"trim_whitespace", "trim_newlines"}}
local formatter__3epackage = {ruff_organize_imports = "ruff", ruff_format = "ruff"}
local disable_formatter_on_save = {fennel = true, sql = true}
local disable_formatter_auto_install = {fnlfmt = true, rustfmt = true, trim_whitespace = true, trim_newlines = true, gleam = true}
local function _1_(_, opts)
  local conform = require("conform")
  local registry = require("mason-registry")
  local formatters_for_mason = {}
  conform.formatters.shfmt = {prepend_args = {"-i", "2", "-ci"}}
  local function _2_()
    for _ft, formatters in pairs(filetype__3eformatters) do
      for _idx, formatter in ipairs(formatters) do
        if not disable_formatter_auto_install[formatter] then
          formatters_for_mason[(formatter__3epackage[formatter] or formatter)] = true
        else
        end
      end
    end
    for formatter, _true in pairs(formatters_for_mason) do
      local pkg = registry.get_package(formatter)
      if not pkg:is_installed() then
        vim.notify(("Automatically installing " .. formatter .. " with Mason."))
        pkg:install()
      else
      end
    end
    return nil
  end
  vim.schedule(_2_)
  vim.g.dotfiles_format_on_save = true
  conform.setup(opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
local function _5_()
  if (nil == vim.b.dotfiles_format_on_save) then
    vim.b.dotfiles_format_on_save = false
  else
    vim.b.dotfiles_format_on_save = not vim.b.dotfiles_format_on_save
  end
  return vim.notify(("Set vim.b.dotfiles_format_on_save to " .. tostring(vim.b.dotfiles_format_on_save)))
end
local function _7_()
  vim.g.dotfiles_format_on_save = not vim.g.dotfiles_format_on_save
  return vim.notify(("Set vim.g.dotfiles_format_on_save to " .. tostring(vim.g.dotfiles_format_on_save)))
end
local function _8_(_buf)
  if (vim.g.dotfiles_format_on_save and ((nil == vim.b.dotfiles_format_on_save) or vim.b.dotfiles_format_on_save) and not disable_formatter_on_save[vim.bo.filetype]) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
local function _10_()
  return require("conform").format()
end
local function _11_()
  return print(vim.inspect(vim.lsp.buf.list_worspace_folders()))
end
return {{"williamboman/mason.nvim", opts = {}}, {"neovim/nvim-lspconfig"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/nvim-cmp"}, {"stevearc/conform.nvim", config = _1_, dependencies = {"rcarriga/nvim-notify"}, keys = {{"<leader>tf", _5_, desc = "Toggle buffer formatting"}, {"<leader>tF", _7_, desc = "Toggle global formatting"}}, opts = {formatters_by_ft = filetype__3eformatters, format_on_save = _8_}}, {"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, opts = {ensure_installed = lsps, automatic_installation = true}}, {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "stevearc/conform.nvim"}, keys = {{"<leader>ld", "<CMD>Telescope lsp_definitions<CR>", desc = "LSP definition"}, {"<leader>lu", "<CMD>Telescope lsp_implementations<CR>", desc = "LSP implementations"}, {"<leader>lt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "LSP type definitions"}, {"<leader>lr", "<CMD>Telescope lsp_references<CR>", desc = "LSP references"}, {"<leader>li", "<CMD>Telescope lsp_incoming_calls<CR>", desc = "LSP incoming calls"}, {"<leader>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "LSP outgoing calls"}, {"<leader>ds", "<CMD>Telescope lsp_document_symbols<CR>", desc = "LSP document symbols"}, {"<leader>dS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "LSP workspace symbols"}, {"<leader>lx", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "LSP dynamic workspace symbols (all workspaces)"}, {"<leader>laf", _10_, desc = "LSP format"}, {"<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction"}, {"K", vim.lsp.buf.hover, desc = "Hover Documentation"}, {"<C-k>", vim.lsp.buf.signature_help, desc = "Signature Documentation"}, {"gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration"}, {"gI", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation"}, {"gd", vim.lsp.buf.definition, desc = "[G]oto [D]efnition"}, {"<leader>rn", vim.lsp.buf.rename, desc = "LSP [R]e[n]ame"}, {"<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "[W]orkspace [A]dd Folder"}, {"<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "[W]orkspace [R]emove Folder"}, {"<leader>wl", _11_, desc = "[W]orkspace [L]ist Folders"}}, lazy = false}, {"RubixDev/mason-update-all", cmd = "MasonUpdateAll", dependencies = {"williamboman/mason.nvim"}, main = "mason-update-all", opts = {}}}
