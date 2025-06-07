-- Create an augroup to avoid duplicate autocmds
local go_augroup = vim.api.nvim_create_augroup('GoAutoGroup', { clear = true })

-- Define the autocmd for BufWritePre on *.go files
-- automatically add or remove imports in .go
vim.api.nvim_create_autocmd('BufWritePre', {
  group = go_augroup,
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    -- You can increase the timeout (e.g., 3000 or 5000 ms) if needed to avoid saving twice
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local client = vim.lsp.get_client_by_id(res.client_id) or {}
          local enc = client.offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        elseif r.command then
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
    vim.lsp.buf.format { async = false }
  end,
})
