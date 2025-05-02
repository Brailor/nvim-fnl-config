(import-macros {: tx} :config.macros)


(tx "nvim-lualine/lualine.nvim" {
    :opts {
    	:options {
		:icons-enabled false
		:theme "auto"
		:component-separators "|"
		:section-separators ""
	}
    }
    })
