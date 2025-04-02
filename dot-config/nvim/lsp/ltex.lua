-- From nvim-lspconfig
local language_id_mapping = {
  bib = "bibtex",
  plaintex = "tex",
  rnoweb = "rsweave",
  rst = "restructuredtext",
  tex = "latex",
  pandoc = "markdown",
  text = "plaintext",
}

local filetypes = {
  "bib",
  "gitcommit",
  "markdown",
  "org",
  "plaintex",
  "rst",
  "rnoweb",
  "tex",
  "pandoc",
  "quarto",
  "rmd",
  "context",
  "html",
  "xhtml",
  "mail",
  "text",
}

local function get_language_id(_, filetype)
  local language_id = language_id_mapping[filetype]
  if language_id then
    return language_id
  else
    return filetype
  end
end
local enabled_ids = {}
do
  local enabled_keys = {}
  for _, ft in ipairs(filetypes) do
    local id = get_language_id({}, ft)
    if not enabled_keys[id] then
      enabled_keys[id] = true
      table.insert(enabled_ids, id)
    end
  end
end

return {
  -- Problem was just java (jdk) and environment variables (JAVA_HOME)
  -- missing...
  -- cmd = { "ltex-ls" },
  -- cmd = { "/run/current-system/sw/bin/ltex-ls" },
  -- filetypes = { "tex", "latex" },
  -- settings = { ltex = { language = "da_DK" } },

  cmd = { "ltex-ls" },
  filetypes = filetypes,
  -- root_dir = function(fname)
  --   return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  -- end,
  single_file_support = true,
  get_language_id = get_language_id,
  settings = {
    ltex = {
      enabled = enabled_ids,
      language = "auto",
    },
  },
}
