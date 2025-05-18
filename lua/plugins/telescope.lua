-- [nfnl] fnl/plugins/telescope.fnl
local function _1_(_, opts)
  local telescope = require("telescope")
  telescope.setup(opts)
  telescope.load_extension("fzf")
  return telescope.load_extension("undo")
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = {{"<C-p>", "<CMD>Telescope git_files<CR>", desc = "Find files"}, {"<C-h>", "<CMD>Telescope find_files hidden=true<CR>", desc = "Find all files"}, {"<C-l>", "<CMD>Telescope live_grep<CR>", desc = "Find grep"}, {"<leader>sw", "<CMD>Telescope grep_string<CR>", desc = "Grep string under cursor"}, {"<leader><space>", "<CMD>Telescope buffers<CR>", desc = "Find buffers"}, {"<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "Find help tags"}, {"<leader>cc", "<CMD>Telescope commands<CR>", desc = "Find commands"}, {"<leader>?", "<CMD>Telescope oldfiles<CR>", desc = "Find recent files"}, {"<leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Find keymaps"}, {"<leader>fu", "<CMD>Telescope undo<CR>", desc = "Find undo"}, {"<leader>fs", "<CMD>Telescope spell_suggest<CR>", desc = "Find spelling"}}, opts = {extensions = {undo = {}}, defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--glob=!.git/"}}}, tag = "0.1.8"}
