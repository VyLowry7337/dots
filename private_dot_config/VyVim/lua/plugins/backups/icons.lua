local file = {
    scm = { icon = "", name = "TreeSitterQuery", color = "#9ab255" },
    md = { icon = "", name = "DevIconMarkDown", color = "#53B1EB" },
    html = { icon = "", name = "HtmlFile", color = "#E06C75" },
    json = { icon = "", name = "Json", color = "#e5c07b" },
    xib = { icon = "󰗀", name = "XibXml", color = "#e37933" },
    ts = { icon = "󰛦", name = "Typescript", color = "#0088d1" },
    js = { icon = "", name = "Javascript", color = "#ffca27" },
    jsx = { icon = "", name = "JavascriptReact", color = "#44B0CC" },
    cjs = { icon = "", name = "Javascript", color = "#ffca27" },
    mjs = { icon = "", name = "Javascript", color = "#ffca27" },
    sh = { icon = "", name = "Sh", color = "#ff7043" },
    zsh = { icon = "", name = "Zsh", color = "#89e051" },
    bash = { icon = "", name = "Bash", color = "#768495" },
    fish = { icon = "", name = "Fish", color = "#40a0d5" },
    rs = { icon = "", name = "Rust", color = "#FA6F42" },
    toml = { icon = "", name = "Toml", color = "#42a5f5" },
    yml = { icon = "󰈚", name = "Yaml", color = "#FA6F42" },
    zip = { icon = "", name = "Zip", color = "#FA6F42" },
    mp3 = { icon = "󰎆", name = "Mp3" },
    mp4 = { icon = "", name = "Mp4" },
    out = { icon = "", name = "Out" },
    rpm = { icon = "", name = "Rpm" },
    ttf = { icon = "", name = "TrueTypeFont" },
    woff = { icon = "", name = "WebOpenFontFormat" },
    woff2 = { icon = "", name = "WebOpenFontFormat2" },
    py = { icon = "", name = "Python", color = "#3776AB" },
    norg = { icon = "", name = "Neorg", color = "#5380C2" },
    env = { icon = "", name = "DotEnv", color = "#D19A66" },
    [".env"] = { icon = "", name = "DotEnv", color = "#D19A66" },
    [".env.development"] = { icon = "", name = "DotEnv", color = "#D19A66" },
    [".env.production"] = { icon = "", name = "DotEnv", color = "#D19A66" },
    [".env.local"] = { icon = "", name = "DotEnv", color = "#D19A66" },
    ["robots.txt"] = { icon = "󰚩", name = "Robots" },
    [".gitignore"] = { icon = "", name = "Gitignore", color = "#e64a19" },
    [".yarnrc.yml"] = { icon = "", name = "DotYarnrc", color = "#0088d1" },
    ["yarn.lock"] = { icon = "", name = "Yarnlock", color = "#2c8ebb" },
    [".dockerignore"] = { icon = "", name = "Dockerignore", color = "#2496ed" },
    Dockerfile = { icon = "", name = "DockerfileScript", color = "#2496ed" },
    [".eslintcache"] = { icon = "󰱺", name = "Eslintcache", color = "#4050b5" },
    [".eslintrc.json"] = { icon = "󰱺", name = "Eslintcache", color = "#4050b5" },
    [".prettierrc"] = { icon = "", name = "Prettierrc", color = "#56b3b4" },
    [".prettierignore"] = { icon = "", name = "Prettierignore", color = "#56b3b4" },
    ["package.json"] = { icon = "", name = "PackageJson", color = "#8bc34b" },
    ["package-lock.json"] = { icon = "", name = "PackageLockJson", color = "#8bc34b" },
    ["pnpm-lock.yaml"] = { icon = "", name = "PnpmLockYaml", color = "#ffb302" },
    ["pnpm-workspace.yaml"] = { icon = "", name = "PnpmWorkspaceYaml", color = "#ffb302" },
    [".luarc.json"] = { icon = "", name = "Luarc", color = "#4e4eeb" },
    ["lazy-lock.json"] = { icon = "󰒲", name = "Lazylock", color = "#82aaff" },
    license = { icon = "󰿃", name = "License", color = "#ff5722" },
    ["readme.md"] = { icon = "", name = "ReadmeLower", color = "#42a5f5" },
    ["README.md"] = { icon = "", name = "ReadmeUpper", color = "#42a5f5" },
    ["nuxt.config.js"] = { icon = "󱄆", name = "NuxtConfig", color = "#41b883" },
    ["next.config.js"] = { icon = "", name = "NextConfig", color = "#FFFFFF" },
    ["tailwind.config.ts"] = { icon = "󱏿", name = "TailwindConfig", color = "#6AB4AC" },
    ["tailwind.config.js"] = { icon = "󱏿", name = "TailwindConfig", color = "#6AB4AC" },
    ["postcss.config.js"] = { icon = "", name = "PostcssConfigJs", color = "#D3483E" },
    ["postcss.config.mjs"] = { icon = "", name = "PostcssConfigMjs", color = "#D3483E" },
    ["panda.config.ts"] = { icon = "󰏚", name = "PandaConfigTs", color = "#fde047" },
    ["panda.config.mjs"] = { icon = "󰏚", name = "PandaConfigMjs", color = "#fde047" },
    ["*.stroy.tsx"] = { icon = "", name = "DotStoryTsx", color = "#ff4785" },
    ["*.stroy.ts"] = { icon = "", name = "DotStoryTs", color = "#ff4785" },
    ["*.stories.tsx"] = { icon = "", name = "DotStoriesTsx", color = "#ff4785" },
    ["*.stories.ts"] = { icon = "", name = "DotStoryTs", color = "#ff4785" },
    ["stroy.tsx"] = { icon = "", name = "StoryTsx", color = "#ff4785" },
    ["stroy.ts"] = { icon = "", name = "StoryTs", color = "#ff4785" },
    ["stories.tsx"] = { icon = "", name = "StoriesTsx", color = "#ff4785" },
    ["stories.ts"] = { icon = "", name = "StoriesTs", color = "#ff4785" },
    ["*.spec.tsx"] = { icon = "", name = "TypescriptReactSpec", color = "#44B0CC" },
    ["*.spec.ts"] = { icon = "", name = "TypescriptSpec", color = "#44B0CC" },
    ["*.test.tsx"] = { icon = "", name = "TypescriptReactTest", color = "#44B0CC" },
    ["*.test.ts"] = { icon = "", name = "TypescriptTest", color = "#44B0CC" },
    [".gitattributes"] = { icon = "", name = "Gitattributes", color = "#41535b" },
    ["Gemfile.lock"] = { icon = "", name = "Gemfile.lock", color = "#CC342D" },
    ["Podfile.lock"] = { icon = "", name = "Podfile.lock", color = "#CC342D" },
    ["Gemfile"] = { icon = "", name = "Gemfile", color = "#CC342D" },
    ["Podfile"] = { icon = "", name = "Podfile", color = "#CC342D" },
    ["tsconfig.react.json"] = { icon = "󰛦", name = "TsConfigReactJson", color = "#44B0CC" },
    ["tsconfig.base.json"] = { icon = "󰛦", name = "TsConfigBaseJson", color = "#52AEB0" },
    ["go.mod"] = { icon = "", name = "GoMod", color = "#f6427f" },
    ["go.sum"] = { icon = "", name = "GoSum", color = "#f6427f" },
}

local folder = {
    packages = { icon = "", name = "PackageFolder", color = "#88bf6f" },
    colors = { icon = "", name = "ColorsFolder", color = "#d19a66" },
    panda = { icon = "󰏚", name = "PandaFolder", color = "#fde047" },
    config = { icon = "", name = "ConfigFolder", color = "#546e7a" },
    configs = { icon = "", name = "ConfigsFolder", color = "#546e7a" },
    [".next"] = { icon = "", name = "DotNextFolder", color = "#eeeeee" },
    [".nuxt"] = { icon = "󱄆", name = "NuxtConfig", color = "#00a272" },
    e2e = { icon = "󱥾", name = "EndToEndTestFolder", color = "#27a69a" },
    git = { icon = "", name = "gitFolder", color = "#546e7a" },
    [".git"] = { icon = "", name = "DotgitFolder", color = "#546e7a" },
    [".github"] = { icon = "", name = "DotgithubFolder", color = "#546e7a" },
    [".yarn"] = { icon = "", name = "YarnFolder", color = "#2c8ebb" },
    [".vscode"] = { icon = "", name = "DotvscodeFolder", color = "#42a5f5" },
    [".husky"] = { icon = "󰩃", name = "DotHuskyFolder", color = "#607d8b" },
    ["node_modules"] = { icon = "", name = "NodeModules", color = "#8bc34b" },
    db = { icon = "", name = "Db", color = "#61afee" },
    ["d.ts"] = { icon = "󰛦", name = "DDotTs", color = "#D99648" },
    image = { icon = "󰉏", name = "Image", color = "#c678dd" },
    highlights = { icon = "󰉏", name = "HighlightsFolder", color = "#D99648" },
    plugins = { icon = "󰉗", name = "PluginsFolder", color = "#c678dd" },
    ui = { icon = "󰨵", name = "UiFolder", color = "#2c8ebb" },
    custom = { icon = "", name = "UiFolder", color = "#2c8ebb" },
    core = { icon = "󱃪", name = "CoreFolder", color = "#e06c75" },
}

local override = {}
for key, value in pairs(folder) do
    override[key] = value
end
for key, value in pairs(file) do
    override[key] = value
end

local docker_icon = file.Dockerfile

return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        local devicons = require("nvim-web-devicons")
        devicons.setup({ override = override })

        local orig = devicons.get_icon
        devicons.get_icon = function(name, ext, opts)
            if name and name:find("^Dockerfile") then
                return orig("Dockerfile", nil, opts)
            end
            return orig(name, ext, opts)
        end

        local orig_color = devicons.get_icon_color
        devicons.get_icon_color = function(name, ext, opts)
            if name and name:find("^Dockerfile") then
                return docker_icon.icon, docker_icon.color
            end
            return orig_color(name, ext, opts)
        end
    end,
}
