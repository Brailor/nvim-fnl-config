
(import-macros {: tx} :config.macros)

;;-- See `:help telescope.builtin`
;;vim.keymap.set('n', '<leader>/', function()
;;  -- You can pass additional configuration to telescope to change theme, layout, etc.
;;  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
;;    winblend = 10,
;;    previewer = false,
;;  })
;;end, { desc = '[/] Fuzzily search in current buffer' })
;;
;;vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = 'Search Files' })
;;vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
;;vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
;;vim.keymap.set('n', '<C-f>', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
;;vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
(tx "nvim-telescope/telescope.nvim"
  {:tag "0.1.8"
   :dependencies ["nvim-lua/plenary.nvim"
                  "debugloop/telescope-undo.nvim"
                  (tx "nvim-telescope/telescope-fzf-native.nvim" {:build "make"})]
   :opts {:extensions {:undo {}}
          :defaults
           {:vimgrep_arguments
            ["rg" "--color=never" "--no-heading"
             "--with-filename" "--line-number" "--column"
             "--smart-case" "--hidden" "--glob=!.git/"]}}
   :config (fn [_ opts]
             (let [telescope (require :telescope)]
               (telescope.setup opts)
               (telescope.load_extension :fzf)
               (telescope.load_extension :undo)))
   :cmd "Telescope"
   :keys [(tx "<C-p>" "<CMD>Telescope git_files<CR>"
            {:desc "Find files"})
          (tx "<C-h>" "<CMD>Telescope find_files hidden=true<CR>"
            {:desc "Find all files"})
          (tx "<C-l>" "<CMD>Telescope live_grep<CR>"
            {:desc "Find grep"})
          (tx "<leader>sw" "<CMD>Telescope grep_string<CR>"
            {:desc "Grep string under cursor"})
          (tx "<leader><space>" "<CMD>Telescope buffers<CR>"
            {:desc "Find buffers"})
          (tx "<leader>sh" "<CMD>Telescope help_tags<CR>"
            {:desc "Find help tags"})
          (tx "<leader>cc" "<CMD>Telescope commands<CR>"
            {:desc "Find commands"})
          (tx "<leader>?" "<CMD>Telescope oldfiles<CR>"
            {:desc "Find recent files"})
          (tx "<leader>fk" "<CMD>Telescope keymaps<CR>"
            {:desc "Find keymaps"})
          (tx "<leader>fu" "<CMD>Telescope undo<CR>"
            {:desc "Find undo"})
          (tx "<leader>fs" "<CMD>Telescope spell_suggest<CR>"
            {:desc "Find spelling"})]})
