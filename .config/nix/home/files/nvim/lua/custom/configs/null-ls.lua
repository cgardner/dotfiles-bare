local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- php
  b.formatting.phpcsfixer.with {
    args = {
      "--no-interaction", "--quiet", "fix", "$FILENAME", "--config", "./tools/php-cs-fixer/.php-cs-fixer.dist.php"
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
