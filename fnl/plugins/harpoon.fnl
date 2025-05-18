(import-macros {: tx} :config.macros)

; vim.keymap.set('n', '<leader>j', '<cmd>:lua require("harpoon.ui").nav_file(1)<cr>', {desc = 'Move to the first file'})
; vim.keymap.set('n', '<leader>k', '<cmd>:lua require("harpoon.ui").nav_file(2)<cr>', {desc = 'Move to the second file'})
; vim.keymap.set('n', '<leader>l', '<cmd>:lua require("harpoon.ui").nav_file(3)<cr>', {desc = 'Move to the third file'})
; vim.keymap.set('n', '<leader>;', '<cmd>:lua require("harpoon.ui").nav_file(4)<cr>', {desc = 'Move to the fourth file'})
; vim.keymap.set('n', '<c-n>', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>', { desc = 'Show Harpoon menu'})
; vim.keymap.set('n', '<leader>a', '<cmd>:lua require("harpoon.mark").add_file()<cr>', { desc = 'Add file to Harpoon' })

(tx "ThePrimeagen/harpoon" {
    :version "*" 
    :dependencies ["nvim-lua/plenary.nvim"]
    :keys [
        (tx "<leader>j" "<CMD>:lua require(\"harpoon.ui\").nav_file(1)<CR>" {:desc "Move to the first file"})
        (tx "<leader>k" "<CMD>:lua require(\"harpoon.ui\").nav_file(2)<CR>" {:desc "Move to the second file"})
        (tx "<leader>l" "<CMD>:lua require(\"harpoon.ui\").nav_file(3)<CR>" {:desc "Move to the third file"})
        (tx "<leader>;" "<CMD>:lua require(\"harpoon.ui\").nav_file(4)<CR>" {:desc "Move to the fourth file"})
        (tx "<C-n>" "<CMD>:lua require(\"harpoon.ui\").toggle_quick_menu()<CR>" {:desc "Show Harpoon menu"})
        (tx "<leader>a" "<CMD>:lua require(\"harpoon.mark\").add_file()<CR>" {:desc "Add file to Harpoon"})]})
