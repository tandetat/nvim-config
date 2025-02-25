return {
  {
    'neo451/feed.nvim',
    cmd = 'Feed',
    dependencies = {
      { 'j-hui/fidget.nvim', lazy = true },
    },
    opts = {
      search = { backend = 'telescope' },
      feeds = {
        -- tags given to a feed to be tagged to all its entries
        { 'https://neovim.io/news.xml', name = 'Neovim News', tags = { 'tech', 'news' } },
        { 'https://news.ycombinator.com/rss', name = 'Hacker News', tags = { 'tech', 'news' } },
      },
    },
  },
}
