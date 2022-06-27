local M = {}

local function init()
  vim.cmd[[let g:mkdp_preview_options = {
    \ 'uml': {
      \ 'imageFormat': 'png',
      \ 'server': 'http://localhost:8080'
    \ }
  \}]]
end
M.init = init

return M