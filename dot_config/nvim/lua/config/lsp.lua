local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  -- navic
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- mason
local mason = require("mason")
mason.setup()

-- mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn"t have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
  ["pylsp"] = function()
    require("lspconfig").pylsp.setup({
      on_attach = on_attach,
      settings = {
        pylsp = {
          plugins = {
            -- python-lsp-server[all] plugins will be disabled
            autopep8 = { enabled = false },
            flake8 = { enabled = false },
            mccabe = { enabled = false },
            preload = { enabled = false },
            pycodestyle = { enabled = false },
            pydocstyle = { enabled = false },
            pyflakes = { enabled = false },
            pylint = { enabled = false },
            rope_autocomplete = { enabled = false },
            rope_completion = { enabled = false },
            yapf = { enabled = false },
            -- 3rd-party plugins
            mypy = { enabled = true },
          },
        },
      },
    })
  end,
  ["bashls"] = function()
    require("lspconfig").bashls.setup({
      on_attach = on_attach,
      filetypes = { "sh", "bash", "zsh" },
    })
  end,
  ["golangclilsp"] = function()
    require("lspconfig").golangclilsp.setup({
      on_attach = on_attach,
      default_config = {
        cmd = { "golangci-lint-langserver" },
        root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
        init_options = {
          command = {
            "golangci-lint",
            "run",
            "--enable",
            "gofumpt",
            "--enable",
            "goimports",
            "--out-format",
            "json",
            "--issues-exit-code=1",
          },
        },
      },
    })
  end,
})
