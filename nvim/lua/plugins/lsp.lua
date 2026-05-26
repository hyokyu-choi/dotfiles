require("mason").setup()

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "texlab",
  "pylsp",
  "vimls",
  "yamlls",
  "bashls",
  "rust-analyzer",
  "taplo",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
