return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua",
  },
  opts = {
    provider = "copilot",

    providers = {
      copilot = {
      },

      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o-mini", 
        api_key = os.getenv("OPENAI_API_KEY"),
        extra_request_body = {
          temperature = 0.2,
        },
      },
    },

    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      accept = "<leader>ac",
      reject = "<leader>ar",
    },
  },
}

