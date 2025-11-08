return { 
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate", 
	config = function () 
		require'nvim-treesitter.configs'.setup { 
			ensure_installed = { 
				"html", "css", "typescript", "lua", "tsx", "javascript", "php", "php_only", "phpdoc"
			}, 
			sync_install = false, 
			auto_install = true, 
			highlight = { 
				enable = true, 
				-- disable = { "php" },
				-- additional_vim_regex_highlighting = false, 
			}, 
		} 
	end 
}
