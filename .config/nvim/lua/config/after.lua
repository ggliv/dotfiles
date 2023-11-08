-- This should be the last file to be run by lazy, after all plugins

-- Don't insert comments with o/O in normal mode
-- Necessary because ftplugin clobbers formatoptions set early on
vim.opt.formatoptions:remove('o')
