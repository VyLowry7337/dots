local C = {
  -- mocha core
  red = '#f38ba8',
  maroon = '#eba0ac',
  peach = '#fab387',
  yellow = '#f9e2af',
  green = '#a6e3a1',
  teal = '#94e2d5',
  sky = '#89dceb',
  sapphire = '#74c7ec',
  blue = '#8aadf4',
  lavender = '#b4befe',
  mauve = '#cba6f7',

  text = '#cdd6f4',
  overlay = '#6c7086',

  -- accents (cross-flavour)
  flamingo = '#f2cdcd',
  pink = '#f5c2e7',
  rosewater = '#f5e0dc',

  mac_teal = '#8bd5ca',
  mac_green = '#a6da95',

  frappe_yellow = '#e5c890',
  frappe_teal = '#81c8be',

  latte_green = '#40a02b',
}

local overrides = {
  -- ========= CORE LANGUAGES =========
  js = { icon = ' ', name = 'Javascript', color = C.yellow },
  ts = { icon = '󰛦 ', name = 'Typescript', color = C.blue },
  jsx = { icon = ' ', name = 'React', color = C.sky },
  tsx = { icon = ' ', name = 'ReactTS', color = C.sky },

  py = { icon = '󰌠 ', name = 'Python', color = C.frappe_yellow },
  rs = { icon = '󱘗 ', name = 'Rust', color = C.peach },
  go = { icon = ' ', name = 'Go', color = C.sky },
  ruby = { icon = ' ', name = 'Ruby', color = C.red },
  lua = { icon = ' ', name = 'Lua', color = C.blue },
  luac = { icon = ' ', name = 'Lua', color = C.blue },
  c = { icon = ' ', name = 'C', color = C.blue },
  swift = { icon = ' ', name = 'Swift', color = C.peach },
  vim = { icon = ' ', name = 'Vim', color = C.green },

  -- ========= WEB =========
  html = { icon = '󰌝 ', name = 'Html', color = C.peach },
  css = { icon = ' ', name = 'Css', color = C.blue },
  scss = { icon = '󰟬 ', name = 'Scss', color = C.pink },
  django = { icon = ' ', name = 'Django', color = C.green },
  jinja = { icon = ' ', name = 'Jinja', color = C.red },

  -- ========= DATA =========
  json = { icon = ' ', name = 'Json', color = C.yellow },
  yml = { icon = ' ', name = 'Yaml', color = C.peach },
  yaml = { icon = ' ', name = 'Yaml', color = C.peach },
  toml = { icon = ' ', name = 'Toml', color = C.red },
  csv = { icon = ' ', name = 'Csv', color = C.green },
  sql = { icon = ' ', name = 'Sql', color = C.yellow },
  sqlite = { icon = ' ', name = 'Sql', color = C.yellow },
  sqlite3 = { icon = ' ', name = 'Sql', color = C.yellow },
  db = { icon = ' ', name = 'Database', color = C.yellow },
  query = { icon = ' ', name = 'Query', color = C.green },
  ['.query'] = { icon = ' ', name = 'Query', color = C.green },

  -- ========= MARKDOWN =========
  md = { icon = '󰍔 ', name = 'Markdown', color = C.blue },
  markdown = { icon = '󰍔 ', name = 'Markdown', color = C.blue },

  -- ========= SHELL =========
  sh = { icon = ' ', name = 'Shell', color = C.green },
  zsh = { icon = ' ', name = 'Zsh', color = C.mac_green },
  bash = { icon = ' ', name = 'Bash', color = C.green },
  fish = { icon = ' ', name = 'Fish', color = C.mac_green },
  tmux = { icon = ' ', name = 'Tmux', color = C.green },

  -- ========= DOCKER =========
  Dockerfile = { icon = '󰡨 ', name = 'Docker', color = C.blue },
  ['docker-compose.yml'] = { icon = ' ', name = 'DockerCompose', color = C.blue },

  -- ========= NODE / PACKAGE =========
  ['package.json'] = { icon = ' ', name = 'PackageJson', color = C.green },
  ['package-lock.json'] = { icon = ' ', name = 'PackageLock', color = C.green },
  ['pnpm-lock.yaml'] = { icon = ' ', name = 'PNPM', color = C.peach },
  ['yarn.lock'] = { icon = ' ', name = 'Yarn', color = C.mauve },

  -- ========= ENV =========
  env = { icon = ' ', name = 'Env', color = C.yellow },
  ['.env'] = { icon = ' ', name = 'Env', color = C.yellow },
  ['.env.local'] = { icon = ' ', name = 'EnvLocal', color = C.yellow },

  -- ========= LINT / FORMAT =========
  ['.eslintrc.json'] = { icon = '󰱺 ', name = 'ESLint', color = C.lavender },
  ['eslint.config.js'] = { icon = '󰱺 ', name = 'ESLint', color = C.lavender },

  ['.prettierrc'] = { icon = ' ', name = 'Prettier', color = C.teal },

  -- ========= FRAMEWORKS =========
  ['next.config.js'] = { icon = ' ', name = 'NextJS', color = C.text },
  ['nuxt.config.js'] = { icon = '󱄆 ', name = 'Nuxt', color = C.green },
  ['vite.config.ts'] = { icon = ' ', name = 'Vite', color = C.mauve },

  -- ========= CSS TOOLING =========
  ['tailwind.config.ts'] = { icon = '󱏿 ', name = 'Tailwind', color = C.sky },
  ['postcss.config.js'] = { icon = ' ', name = 'PostCSS', color = C.red },

  -- ========= TESTING =========
  ['test.ts'] = { icon = '󰙨 ', name = 'TestTS', color = C.sky },
  ['spec.ts'] = { icon = '󰙨 ', name = 'SpecTS', color = C.sky },

  -- ========= STORYBOOK =========
  ['stories.tsx'] = { icon = ' ', name = 'Storybook', color = C.red },

  -- ========= CONFIG =========
  ['tsconfig.json'] = { icon = '󰛦 ', name = 'TSConfig', color = C.blue },
  ['.luarc.json'] = { icon = ' ', name = 'LuaRC', color = C.lavender },

  -- ========= VERSION CONTROL =========
  ['.gitignore'] = { icon = ' ', name = 'GitIgnore', color = C.red },

  -- ========= DOCS =========
  ['readme.md'] = { icon = ' ', name = 'Readme', color = C.blue },
  ['README.md'] = { icon = ' ', name = 'Readme', color = C.blue },
  ['txt'] = { icon = '󰈚 ', name = 'Text', color = C.green },

  -- ========= MISC =========
  license = { icon = '󰿃 ', name = 'License', color = C.yellow },
  ['unlicense'] = { icon = '󰿃 ', name = 'License', color = C.yellow },
  ['copying'] = { icon = '󰿃 ', name = 'License', color = C.yellow },
  ['copying.lesser'] = { icon = '󰿃 ', name = 'License', color = C.yellow },
  ['license.md'] = { icon = '󰿃 ', name = 'License', color = C.yellow },
  -- ecosystem
  node_modules = { icon = ' ', name = 'NodeModules', color = C.green },

  -- vcs
  ['.git'] = { icon = ' ', name = 'Git', color = C.peach },
  ['.github'] = { icon = ' ', name = 'GitHub', color = C.peach },

  -- editors
  ['.vscode'] = { icon = ' ', name = 'VSCode', color = C.blue },

  -- package managers
  ['.yarn'] = { icon = ' ', name = 'Yarn', color = C.mauve },

  -- config
  config = { icon = ' ', name = 'Config', color = C.overlay },
  configs = { icon = ' ', name = 'Configs', color = C.overlay },

  -- src structure
  src = { icon = ' ', name = 'Source', color = C.blue },
  components = { icon = '󰨵 ', name = 'Components', color = C.sky },
  pages = { icon = '󰧮 ', name = 'Pages', color = C.mauve },
  layouts = { icon = '󰨵 ', name = 'Layouts', color = C.teal },

  -- features
  hooks = { icon = '󰛢 ', name = 'Hooks', color = C.peach },
  utils = { icon = '󰕥 ', name = 'Utils', color = C.yellow },
  lib = { icon = '󰅩 ', name = 'Lib', color = C.lavender },

  -- testing
  __tests__ = { icon = ' ', name = 'Tests', color = C.mauve },
  e2e = { icon = '󱥾 ', name = 'E2E', color = C.mauve },

  -- utilities
  zip = { icon = '', name = 'Zip', color = C.yellow },
  mp3 = { icon = '󰎆', name = 'Mp3', color = C.mauve },
  mp4 = { icon = '', name = 'Mp4', color = C.mauve },
  out = { icon = '', name = 'Out', color = C.mauve },
  rpm = { icon = '', name = 'Rpm', color = C.mauve },
  ttf = { icon = '', name = 'TrueTypeFont', color = C.rosewater },
  woff = { icon = '', name = 'WebOpenFontFormat', color = C.rosewater },
  woff2 = { icon = '', name = 'WebOpenFontFormat2', color = C.rosewater },

  -- assets
  assets = { icon = '󰉏 ', name = 'Assets', color = C.pink },
  images = { icon = '󰉏 ', name = 'Images', color = C.pink },

  -- styles
  styles = { icon = ' ', name = 'Styles', color = C.blue },

  -- core
  core = { icon = '󱃪 ', name = 'Core', color = C.red },

  -- plugins
  plugins = { icon = '󰉗 ', name = 'Plugins', color = C.mauve },
  ['lazy-lock.json'] = { icon = '󰒲', name = 'Lazylock', color = C.blue },
  scm = { icon = '', name = 'TreeSitterQuery', color = C.green },
}

-- local file = {
--   md = { icon = '', name = 'DevIconMarkDown', color = '#53B1EB' },
--   html = { icon = '', name = 'HtmlFile', color = '#E06C75' },
--   json = { icon = '', name = 'Json', color = '#e5c07b' },
--   xib = { icon = '󰗀', name = 'XibXml', color = '#e37933' },
--   ts = { icon = '󰛦', name = 'Typescript', color = '#0088d1' },
--   js = { icon = '', name = 'Javascript', color = '#ffca27' },
--   jsx = { icon = '', name = 'JavascriptReact', color = '#44B0CC' },
--   cjs = { icon = '', name = 'Javascript', color = '#ffca27' },
--   mjs = { icon = '', name = 'Javascript', color = '#ffca27' },
--   sh = { icon = '', name = 'Sh', color = '#ff7043' },
--   zsh = { icon = '', name = 'Zsh', color = '#89e051' },
--   bash = { icon = '', name = 'Bash', color = '#768495' },
--   fish = { icon = '', name = 'Fish', color = '#40a0d5' },
--   rs = { icon = '', name = 'Rust', color = '#FA6F42' },
--   toml = { icon = '', name = 'Toml', color = '#42a5f5' },
--   yml = { icon = '󰈚', name = 'Yaml', color = '#FA6F42' },
--   zip = { icon = '', name = 'Zip', color = '#FA6F42' },
--   mp3 = { icon = '󰎆', name = 'Mp3' },
--   mp4 = { icon = '', name = 'Mp4' },
--   out = { icon = '', name = 'Out' },
--   rpm = { icon = '', name = 'Rpm' },
--   ttf = { icon = '', name = 'TrueTypeFont' },
--   woff = { icon = '', name = 'WebOpenFontFormat' },
--   woff2 = { icon = '', name = 'WebOpenFontFormat2' },
--   py = { icon = '', name = 'Python', color = '#3776AB' },
--   norg = { icon = '', name = 'Neorg', color = '#5380C2' },
--   env = { icon = '', name = 'DotEnv', color = '#D19A66' },
--   ['.env'] = { icon = '', name = 'DotEnv', color = '#D19A66' },
--   ['.env.development'] = { icon = '', name = 'DotEnv', color = '#D19A66' },
--   ['.env.production'] = { icon = '', name = 'DotEnv', color = '#D19A66' },
--   ['.env.local'] = { icon = '', name = 'DotEnv', color = '#D19A66' },
--   ['robots.txt'] = { icon = '󰚩', name = 'Robots' },
--   ['.gitignore'] = { icon = '', name = 'Gitignore', color = '#e64a19' },
--   ['.yarnrc.yml'] = { icon = '', name = 'DotYarnrc', color = '#0088d1' },
--   ['yarn.lock'] = { icon = '', name = 'Yarnlock', color = '#2c8ebb' },
--   ['.dockerignore'] = { icon = '', name = 'Dockerignore', color = '#2496ed' },
--   Dockerfile = { icon = '', name = 'DockerfileScript', color = '#2496ed' },
--   ['.eslintcache'] = { icon = '󰱺', name = 'Eslintcache', color = '#4050b5' },
--   ['.eslintrc.json'] = { icon = '󰱺', name = 'Eslintcache', color = '#4050b5' },
--   ['.prettierrc'] = { icon = '', name = 'Prettierrc', color = '#56b3b4' },
--   ['.prettierignore'] = { icon = '', name = 'Prettierignore', color = '#56b3b4' },
--   ['package.json'] = { icon = '', name = 'PackageJson', color = '#8bc34b' },
--   ['package-lock.json'] = { icon = '', name = 'PackageLockJson', color = '#8bc34b' },
--   ['pnpm-lock.yaml'] = { icon = '', name = 'PnpmLockYaml', color = '#ffb302' },
--   ['pnpm-workspace.yaml'] = { icon = '', name = 'PnpmWorkspaceYaml', color = '#ffb302' },
--   ['.luarc.json'] = { icon = '', name = 'Luarc', color = '#4e4eeb' },
--   ['lazy-lock.json'] = { icon = '󰒲', name = 'Lazylock', color = '#82aaff' },
--   license = { icon = '󰿃', name = 'License', color = '#ff5722' },
--   ['readme.md'] = { icon = '', name = 'ReadmeLower', color = '#42a5f5' },
--   ['README.md'] = { icon = '', name = 'ReadmeUpper', color = '#42a5f5' },
--   ['nuxt.config.js'] = { icon = '󱄆', name = 'NuxtConfig', color = '#41b883' },
--   ['next.config.js'] = { icon = '', name = 'NextConfig', color = '#FFFFFF' },
--   ['tailwind.config.ts'] = { icon = '󱏿', name = 'TailwindConfig', color = '#6AB4AC' },
--   ['tailwind.config.js'] = { icon = '󱏿', name = 'TailwindConfig', color = '#6AB4AC' },
--   ['postcss.config.js'] = { icon = '', name = 'PostcssConfigJs', color = '#D3483E' },
--   ['postcss.config.mjs'] = { icon = '', name = 'PostcssConfigMjs', color = '#D3483E' },
--   ['panda.config.ts'] = { icon = '󰏚', name = 'PandaConfigTs', color = '#fde047' },
--   ['panda.config.mjs'] = { icon = '󰏚', name = 'PandaConfigMjs', color = '#fde047' },
--   ['*.stroy.tsx'] = { icon = '', name = 'DotStoryTsx', color = '#ff4785' },
--   ['*.stroy.ts'] = { icon = '', name = 'DotStoryTs', color = '#ff4785' },
--   ['*.stories.tsx'] = { icon = '', name = 'DotStoriesTsx', color = '#ff4785' },
--   ['*.stories.ts'] = { icon = '', name = 'DotStoryTs', color = '#ff4785' },
--   ['stroy.tsx'] = { icon = '', name = 'StoryTsx', color = '#ff4785' },
--   ['stroy.ts'] = { icon = '', name = 'StoryTs', color = '#ff4785' },
--   ['stories.tsx'] = { icon = '', name = 'StoriesTsx', color = '#ff4785' },
--   ['stories.ts'] = { icon = '', name = 'StoriesTs', color = '#ff4785' },
--   ['*.spec.tsx'] = { icon = '', name = 'TypescriptReactSpec', color = '#44B0CC' },
--   ['*.spec.ts'] = { icon = '', name = 'TypescriptSpec', color = '#44B0CC' },
--   ['*.test.tsx'] = { icon = '', name = 'TypescriptReactTest', color = '#44B0CC' },
--   ['*.test.ts'] = { icon = '', name = 'TypescriptTest', color = '#44B0CC' },
--   ['.gitattributes'] = { icon = '', name = 'Gitattributes', color = '#41535b' },
--   ['Gemfile.lock'] = { icon = '', name = 'Gemfile.lock', color = '#CC342D' },
--   ['Podfile.lock'] = { icon = '', name = 'Podfile.lock', color = '#CC342D' },
--   ['Gemfile'] = { icon = '', name = 'Gemfile', color = '#CC342D' },
--   ['Podfile'] = { icon = '', name = 'Podfile', color = '#CC342D' },
--   ['tsconfig.react.json'] = { icon = '󰛦', name = 'TsConfigReactJson', color = '#44B0CC' },
--   ['tsconfig.base.json'] = { icon = '󰛦', name = 'TsConfigBaseJson', color = '#52AEB0' },
--   ['go.mod'] = { icon = '', name = 'GoMod', color = '#f6427f' },
--   ['go.sum'] = { icon = '', name = 'GoSum', color = '#f6427f' },
-- }

-- local folder = {
--   packages = { icon = '', name = 'PackageFolder', color = '#88bf6f' },
--   colors = { icon = '', name = 'ColorsFolder', color = '#d19a66' },
--   panda = { icon = '󰏚', name = 'PandaFolder', color = '#fde047' },
--   config = { icon = '', name = 'ConfigFolder', color = '#546e7a' },
--   configs = { icon = '', name = 'ConfigsFolder', color = '#546e7a' },
--   ['.next'] = { icon = '', name = 'DotNextFolder', color = '#eeeeee' },
--   ['.nuxt'] = { icon = '󱄆', name = 'NuxtConfig', color = '#00a272' },
--   e2e = { icon = '󱥾', name = 'EndToEndTestFolder', color = '#27a69a' },
--   git = { icon = '', name = 'gitFolder', color = '#546e7a' },
--   ['.git'] = { icon = '', name = 'DotgitFolder', color = '#546e7a' },
--   ['.github'] = { icon = '', name = 'DotgithubFolder', color = '#546e7a' },
--   ['.yarn'] = { icon = '', name = 'YarnFolder', color = '#2c8ebb' },
--   ['.vscode'] = { icon = '', name = 'DotvscodeFolder', color = '#42a5f5' },
--   ['.husky'] = { icon = '󰩃', name = 'DotHuskyFolder', color = '#607d8b' },
--   ['node_modules'] = { icon = '', name = 'NodeModules', color = '#8bc34b' },
--   db = { icon = '', name = 'Db', color = '#61afee' },
--   ['d.ts'] = { icon = '󰛦', name = 'DDotTs', color = '#D99648' },
--   image = { icon = '󰉏', name = 'Image', color = '#c678dd' },
--   highlights = { icon = '󰉏', name = 'HighlightsFolder', color = '#D99648' },
--   plugins = { icon = '󰉗', name = 'PluginsFolder', color = '#c678dd' },
--   ui = { icon = '󰨵', name = 'UiFolder', color = '#2c8ebb' },
--   custom = { icon = '', name = 'UiFolder', color = '#2c8ebb' },
--   core = { icon = '󱃪', name = 'CoreFolder', color = '#e06c75' },
-- }

local override = {}
for key, value in pairs(overrides) do
  override[key] = value
end

local docker_icon = override.Dockerfile

return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    local devicons = require('nvim-web-devicons')
    devicons.setup({
      override = override,
    })

    local orig = devicons.get_icon
    devicons.get_icon = function(name, ext, opts)
      if name and name:find('^Dockerfile') then
        return orig('Dockerfile', nil, opts)
      end
      return orig(name, ext, opts)
    end

    local orig_color = devicons.get_icon_color
    devicons.get_icon_color = function(name, ext, opts)
      if name and name:find('^Dockerfile') then
        return docker_icon.icon, docker_icon.color
      end
      return orig_color(name, ext, opts)
    end
  end,
}
