return {
  {
    'GCBallesteros/jupytext.nvim',
    enabled = false,
    opts = {
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    },
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },
}
