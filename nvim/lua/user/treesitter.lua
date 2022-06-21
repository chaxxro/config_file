local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("not find nvim-treesitter, " .. configs)
  return
end

configs.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"c", "cpp", "cmake", "lua", "python", "bash", "markdown"},
  -- install languages synchronously (only applied to `ensure_installed`)
  sync_install = false, 
  -- List of parsers to ignore installing
  ignore_install = { "" }, 
  highlight = {
    -- false will disable the whole extension
    enable = true, 
    -- list of language that will be disabled
    disable = { "" }, 
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
		enable = true,
	},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

