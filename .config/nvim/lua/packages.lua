require('packer').startup(
function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/my_site/',
          path_html = '~/my_site_html'
        }
      }
    end
  }
end)
