return {
  "rcarriga/nvim-notify",
  lazy = true,
  opts = {
    stages = "fade_in_slide_out",
    timeout = 2000,
    render = "default",
    top_down = false,
  },
  config = function(_, opts)
    local ok, notify = pcall(require, "notify")
    if ok then
      notify.setup(opts)
      vim.notify = notify
    end
  end,
}

