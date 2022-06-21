local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("not find lspconfig, " .. lspconfig)
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.lsp-handlers").setup()
