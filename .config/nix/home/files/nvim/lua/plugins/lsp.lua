return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "rnix-lsp", "stylua" },
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    },
    keys = {
      { "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@class ConformOpts
      local opts = {
        -- LazyVim will use these options when formatting with the conform.nvim formatter
        default_format_opts = {
          timeout_ms = 10000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_fallback = true, -- not recommended to change
        },
        ---@type table<string, conform.FormatterUnit[]>
        formatters_by_ft = {
          apexcode = { "prettier" },
          apex = { "prettier" },
          html = { "prettier" },
          lua = { "stylua" },
          sh = { "shfmt" },
          go = { "gofmt", "gofumpt" },
          java = { "google-java-format", "jdtls" },
          javascript = { "prettier", "eslint_d" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
        },
      }
      return opts
    end,
  },
}
