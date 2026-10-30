---@type vim.lsp.Config
return {
  -- Format and organize imports on save
  -- https://go.dev/gopls/editor/vim#neovim-imports
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params)
        for _, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
