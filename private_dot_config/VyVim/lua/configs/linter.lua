local M = require('lint')
local lint = require('lint')

M.linters_by_ft = {
  python = { 'ruff' },
  html = { 'htmlhint' },
  css = { 'stylelint' },
  lua = { 'selene' },
  json = { 'jsonlint' },
  yaml = { 'yamllint' },
  toml = { 'tombi' },
  env = { 'dotenv-linter' },
}
