vim.lsp.enable('lua_ls')

local group = vim.api.nvim_create_augroup('mknejp.lsp', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
