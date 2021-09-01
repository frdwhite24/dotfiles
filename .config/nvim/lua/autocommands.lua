local utils = require'utils'

-- Disable continuation of comments on next line
utils.define_augroups({
    _general_settings = {
      -- not removing "r" as i want leader on <Enter> in insert mode
        {'BufWinEnter', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufRead', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufNewFile', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
    },
})

