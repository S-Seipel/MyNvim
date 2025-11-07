return { 
	"neovim/nvim-lspconfig", 
	config = function() 
		vim.lsp.enable({ 
			"jsonls", -- json-lsp 
			"cssls", -- css-lsp 
			"html", -- html-lsp 
			"yamlls", -- yaml-language-server 
			"intelephense", -- intelephense 
			"emmet_ls", -- emmet-ls 
			"ts_ls", -- typescript-language-server 
			"tailwindcss", 
		}) 

		local ok, lspconfig = pcall(require, "lspconfig") 
		if ok then 
			lspconfig.ts_ls.setup({ 
				settings = { 
					typescript = { 
						preferences = { 
							importModuleSpecifier = "relative" 
						}, 
						tsserver = { 
							useSyntaxServer = "auto" 
						}, 
					}, 
					javascript = { 
						preferences = { 
							importModuleSpecifier = "relative" 
						}, 
					}, 
				}, 
				root_dir = lspconfig.util.root_pattern( 
					"tsconfig.json", 
					"package.json", 
					".git" ), 
			}) 
		end 

		lspconfig.intelephense.setup({})

		vim.diagnostic.config({ 
			virtual_text = { prefix = "●" }, 
			signs = true, 
			underline = true, 
			severity_sort = true, 
		}) 
	end, 
}
