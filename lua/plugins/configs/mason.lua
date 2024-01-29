local mason = {
	-- lua/utils/init.lua
	ensure_installed = {
		-- [[ LSP ]]
		"lua-language-server",
		"clangd",
		"rust-analyzer",
		"zls",
		"gopls",
		"jdtls",

		"html-lsp",
		"css-lsp",
		"typescript-language-server",
		-- "jsonls",
		-- "yamlls",
		"tailwindcss-language-server",
		"emmet-ls",

		-- [[ Linter ]]
		-- "eslint",
		--  eslint-lsp
		--  eslint_d
		-- "stylelint",

    -- [[ Formatter ]]
		"prettier",
		"stylua", -- lua formatter

    -- [[ DAP]]
    "codelldb",
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return mason


-- 󰚌 actionlint
-- 󰚌 ada-language-server
-- 󰚌 alex
-- 󰚌 angular-language-server
-- 󰚌 ansible-language-server
-- 󰚌 ansible-lint
-- 󰚌 antlers-language-server
-- 󰚌 apex-language-server
-- 󰚌 arduino-language-server
-- 󰚌 asm-lsp
-- 󰚌 asmfmt
-- 󰚌 ast-grep
-- 󰚌 astro-language-server
-- 󰚌 autoflake
-- 󰚌 autopep8
-- 󰚌 autotools-language-server
-- 󰚌 awk-language-server
-- 󰚌 azure-pipelines-language-server
-- 󰚌 bash-debug-adapter
-- 󰚌 bash-language-server
-- 󰚌 beancount-language-server
-- 󰚌 beautysh
-- 󰚌 bibtex-tidy
-- 󰚌 bicep-lsp
-- 󰚌 biome
-- 󰚌 black
-- 󰚌 blackd-client
-- 󰚌 blade-formatter
-- 󰚌 blue
-- 󰚌 brighterscript
-- 󰚌 brighterscript-formatter
-- 󰚌 bsl-language-server
-- 󰚌 bslint
-- 󰚌 buf
-- 󰚌 buf-language-server
-- 󰚌 buildifier
-- 󰚌 bzl
-- 󰚌 cairo-language-server
-- 󰚌 cbfmt
-- 󰚌 cds-lsp
-- 󰚌 cfn-lint
-- 󰚌 checkmake
-- 󰚌 checkstyle
-- 󰚌 chrome-debug-adapter
-- 󰚌 clang-format
-- 󰚌 clarinet
-- 󰚌 clarity-lsp deprecated
-- 󰚌 clj-kondo
-- 󰚌 clojure-lsp
-- 󰚌 cmake-language-server
-- 󰚌 cmakelang
-- 󰚌 cmakelint
-- 󰚌 codeql
-- 󰚌 codespell
-- 󰚌 colorgen-nvim
-- 󰚌 commitlint
-- 󰚌 contextive
-- 󰚌 cpplint
-- 󰚌 cpptools
-- 󰚌 cql-language-server
-- 󰚌 crystalline
-- 󰚌 csharp-language-server
-- 󰚌 csharpier
-- 󰚌 cspell
-- 󰚌 cssmodules-language-server
-- 󰚌 cucumber-language-server
-- 󰚌 cueimports
-- 󰚌 cuelsp
-- 󰚌 curlylint
-- 󰚌 custom-elements-languageserver
-- 󰚌 cypher-language-server
-- 󰚌 darker
-- 󰚌 dart-debug-adapter
-- 󰚌 debugpy
-- 󰚌 delve
-- 󰚌 deno
-- 󰚌 detekt
-- 󰚌 dhall-lsp
-- 󰚌 diagnostic-languageserver
-- 󰚌 djlint
-- 󰚌 docformatter
-- 󰚌 docker-compose-language-service
-- 󰚌 dockerfile-language-server
-- 󰚌 doctoc
-- 󰚌 dot-language-server
-- 󰚌 dprint
-- 󰚌 drools-lsp
-- 󰚌 easy-coding-standard
-- 󰚌 editorconfig-checker
-- 󰚌 efm
-- 󰚌 elixir-ls
-- 󰚌 elm-format
-- 󰚌 elm-language-server
-- 󰚌 elp
-- 󰚌 ember-language-server
-- 󰚌 erb-lint
-- 󰚌 erg
-- 󰚌 erg-language-server
-- 󰚌 erlang-debugger
-- 󰚌 erlang-ls
-- 󰚌 esbonio
-- 󰚌 eslint-lsp
-- 󰚌 eslint_d
-- 󰚌 facility-language-server
-- 󰚌 fantomas
-- 󰚌 fennel-language-server
-- 󰚌 firefox-debug-adapter
-- 󰚌 fixjson
-- 󰚌 flake8
-- 󰚌 flux-lsp
-- 󰚌 foam-language-server
-- 󰚌 fortls
-- 󰚌 fourmolu
-- 󰚌 fsautocomplete
-- 󰚌 gci
-- 󰚌 gdtoolkit
-- 󰚌 gersemi
-- 󰚌 gh
-- 󰚌 gitleaks
-- 󰚌 gitlint
-- 󰚌 gitui
-- 󰚌 gleam
-- 󰚌 glint
-- 󰚌 glow
-- 󰚌 go-debug-adapter
-- 󰚌 gofumpt
-- 󰚌 goimports
-- 󰚌 goimports-reviser
-- 󰚌 golangci-lint
-- 󰚌 golangci-lint-langserver
-- 󰚌 golines
-- 󰚌 gomodifytags
-- 󰚌 google-java-format
-- 󰚌 gospel
-- 󰚌 gotests
-- 󰚌 gotestsum
-- 󰚌 gradle-language-server
-- 󰚌 grammarly-languageserver
-- 󰚌 graphql-language-service-cli
-- 󰚌 groovy-language-server
-- 󰚌 hadolint
-- 󰚌 haml-lint
-- 󰚌 haskell-debug-adapter
-- 󰚌 haskell-language-server
-- 󰚌 haxe-language-server
-- 󰚌 hdl-checker
-- 󰚌 helm-ls
-- 󰚌 hoon-language-server
-- 󰚌 htmlbeautifier
-- 󰚌 htmlhint
-- 󰚌 htmx-lsp
-- 󰚌 hydra-lsp
-- 󰚌 iferr
-- 󰚌 impl
-- 󰚌 intelephense
-- 󰚌 isort
-- 󰚌 java-debug-adapter
-- 󰚌 java-language-server
-- 󰚌 java-test
-- 󰚌 jedi-language-server
-- 󰚌 joker
-- 󰚌 jq
-- 󰚌 jq-lsp
-- 󰚌 js-debug-adapter
-- 󰚌 json-lsp
-- 󰚌 json-to-struct
-- 󰚌 jsonld-lsp
-- 󰚌 jsonlint
-- 󰚌 jsonnet-language-server
-- 󰚌 jsonnetfmt
-- 󰚌 julia-lsp
-- 󰚌 kcl
-- 󰚌 kotlin-debug-adapter
-- 󰚌 kotlin-language-server
-- 󰚌 ktlint
-- 󰚌 latexindent
-- 󰚌 lean-language-server
-- 󰚌 lelwel
-- 󰚌 lemminx
-- 󰚌 lemmy-help
-- 󰚌 lemonade
-- 󰚌 llm-ls
-- 󰚌 ltex-ls
-- 󰚌 luacheck
-- 󰚌 luaformatter
-- 󰚌 luau-lsp
-- 󰚌 lwc-language-server
-- 󰚌 markdown-toc
-- 󰚌 markdownlint
-- 󰚌 markdownlint-cli2
-- 󰚌 markmap-cli
-- 󰚌 marksman
-- 󰚌 markuplint
-- 󰚌 matlab-language-server
-- 󰚌 mdformat
-- 󰚌 mdx-analyzer
-- 󰚌 metamath-zero-lsp
-- 󰚌 millet
-- 󰚌 misspell
-- 󰚌 mockdebug
-- 󰚌 move-analyzer
-- 󰚌 mutt-language-server
-- 󰚌 mypy
-- 󰚌 neocmakelsp
-- 󰚌 netcoredbg
-- 󰚌 nextls
-- 󰚌 nginx-language-server
-- 󰚌 nickel-lang-lsp
-- 󰚌 nil
-- 󰚌 nilaway
-- 󰚌 nimlangserver
-- 󰚌 nimlsp
-- 󰚌 node-debug2-adapter
-- 󰚌 nomicfoundation-solidity-language-server
-- 󰚌 nxls
-- 󰚌 ocaml-lsp
-- 󰚌 ocamlformat
-- 󰚌 oelint-adv
-- 󰚌 ols
-- 󰚌 omnisharp
-- 󰚌 omnisharp-mono
-- 󰚌 opencl-language-server
-- 󰚌 openedge-language-server
-- 󰚌 openscad-lsp
-- 󰚌 ormolu
-- 󰚌 oxlint
-- 󰚌 perl-debug-adapter
-- 󰚌 perlnavigator
-- 󰚌 pest-language-server
-- 󰚌 php-cs-fixer
-- 󰚌 php-debug-adapter
-- 󰚌 phpactor
-- 󰚌 phpcbf
-- 󰚌 phpcs
-- 󰚌 phpmd
-- 󰚌 phpstan
-- 󰚌 pico8-ls
-- 󰚌 pint
-- 󰚌 pkgbuild-language-server deprecated
-- 󰚌 prettierd
-- 󰚌 pretty-php
-- 󰚌 prisma-language-server
-- 󰚌 proselint
-- 󰚌 prosemd-lsp
-- 󰚌 protolint
-- 󰚌 psalm
-- 󰚌 puppet-editor-services
-- 󰚌 purescript-language-server
-- 󰚌 purescript-tidy
-- 󰚌 pydocstyle
-- 󰚌 pyflakes
-- 󰚌 pyink
-- 󰚌 pylama
-- 󰚌 pylint
-- 󰚌 pylyzer
-- 󰚌 pyment
-- 󰚌 pyproject-flake8
-- 󰚌 pyre
-- 󰚌 pyright
-- 󰚌 python-lsp-server
-- 󰚌 quick-lint-js
-- 󰚌 r-languageserver
-- 󰚌 raku-navigator
-- 󰚌 reason-language-server
-- 󰚌 remark-cli
-- 󰚌 remark-language-server
-- 󰚌 reorder-python-imports
-- 󰚌 rescript-language-server
-- 󰚌 rescript-lsp deprecated
-- 󰚌 revive
-- 󰚌 ripper-tags
-- 󰚌 rnix-lsp
-- 󰚌 robotframework-lsp
-- 󰚌 rome deprecated
-- 󰚌 rstcheck
-- 󰚌 rubocop
-- 󰚌 ruby-lsp
-- 󰚌 rubyfmt
-- 󰚌 ruff
-- 󰚌 ruff-lsp
-- 󰚌 rufo
-- 󰚌 rustfmt deprecated
-- 󰚌 rustywind
-- 󰚌 salt-lsp
-- 󰚌 selene
-- 󰚌 semgrep
-- 󰚌 serve-d
-- 󰚌 shellcheck
-- 󰚌 shellharden
-- 󰚌 shfmt
-- 󰚌 shopify-theme-check
-- 󰚌 slang
-- 󰚌 slint-lsp
-- 󰚌 smithy-language-server
-- 󰚌 snakefmt
-- 󰚌 snyk
-- 󰚌 snyk-ls
-- 󰚌 solang
-- 󰚌 solang-llvm
-- 󰚌 solargraph
-- 󰚌 solhint
-- 󰚌 solidity
-- 󰚌 solidity-ls
-- 󰚌 sonarlint-language-server
-- 󰚌 sorbet
-- 󰚌 sourcery
-- 󰚌 spectral-language-server
-- 󰚌 sql-formatter
-- 󰚌 sqlfluff
-- 󰚌 sqlfmt
-- 󰚌 sqlls
-- 󰚌 sqls
-- 󰚌 standardjs
-- 󰚌 standardrb
-- 󰚌 staticcheck
-- 󰚌 stimulus-language-server
-- 󰚌 stylelint
-- 󰚌 stylelint-lsp
-- 󰚌 svelte-language-server
-- 󰚌 svlangserver
-- 󰚌 svls
-- 󰚌 swift-mesonlsp
-- 󰚌 taplo
-- 󰚌 teal-language-server
-- 󰚌 tectonic
-- 󰚌 templ
-- 󰚌 terraform-ls
-- 󰚌 texlab
-- 󰚌 textlint
-- 󰚌 tflint
-- 󰚌 tfsec
-- 󰚌 thriftls
-- 󰚌 tlint
-- 󰚌 tree-sitter-cli
-- 󰚌 vim-language-server
-- 󰚌 vls
-- 󰚌 vscode-java-decompiler
-- 󰚌 vtsls
