local M = {}

local function init()
    if (vim.g.started_by_firenvim == true) 
    then
      return
    end
    local cmp = require('cmp')
    cmp.setup(
        {
            snippet = {
                expand = function(args)
                    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end
            },
            mapping = {
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
                ["<M-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ["<C-e>"] = cmp.mapping(
                    {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close()
                    }
                ),
                ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "ultisnips"} -- For ultisnips users.
                },
                {
                    {name = "buffer"}
                }
            )
        }
    )

    -- _G.vimrc = _G.vimrc or {}
    -- _G.vimrc.cmp = _G.vimrc.cmp or {}
    -- _G.vimrc.cmp.on_text_changed = function()
    --     local cursor = vim.api.nvim_win_get_cursor(0)
    --     local line = vim.api.nvim_get_current_line()
    --     local before = string.sub(line, 1, cursor[2] + 1)
    --     if before:match("%s*$") then
    --         cmp.complete() -- Trigger completion only if the cursor is placed at the end of line.
    --     end
    -- end
    -- vim.cmd(
    --     [[
    --       augroup vimrc
    --       autocmd
    --       autocmd TextChanged,TextChangedI,TextChangedP * call luaeval('vimrc.cmp.on_text_changed()')
    --       augroup END
    --     ]]
    -- )
end
M.init = init

return M
