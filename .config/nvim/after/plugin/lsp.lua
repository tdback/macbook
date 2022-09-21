local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	})
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client)
	require('completion').on_attach(client)
end

-- Python
require("lspconfig").pylsp.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- Racket
require("lspconfig").racket_langserver.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- Clojure
require("lspconfig").clojure_lsp.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- C/C++
require("lspconfig").clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- Elixir
require("lspconfig").elixirls.setup{
	cmd = { "/Users/relyt/.config/lsp/language_server.sh" },
	on_attach = on_attach,
	capabilities = capabilities
}

-- Add support for more languages
