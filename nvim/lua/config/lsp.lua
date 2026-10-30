vim.lsp.enable({ "gopls", "tsc" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

    if client:supports_method("textDocument/onTypeFormatting") then
      vim.lsp.on_type_formatting.enable(true, { client_id = client.id })
    end
  end,
})
