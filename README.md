# findspot

findspot is a set of six **Neovim colorschemes** (Vim themes), with matching palette exports for **Alacritty** and **Obsidian**.

The screenshots below are **real Alacritty windows running Neovim**, captured in CI—not mock terminal renderings.

<table>
  <tr>
    <td align="center"><img src="screenshots/alexandria.png" alt="Alexandria in Neovim and Alacritty" width="100%"><br><strong>Alexandria</strong></td>
    <td align="center"><img src="screenshots/babylon.png" alt="Babylon in Neovim and Alacritty" width="100%"><br><strong>Babylon</strong></td>
    <td align="center"><img src="screenshots/knossos.png" alt="Knossos in Neovim and Alacritty" width="100%"><br><strong>Knossos</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/petra.png" alt="Petra in Neovim and Alacritty" width="100%"><br><strong>Petra</strong></td>
    <td align="center"><img src="screenshots/tikal.png" alt="Tikal in Neovim and Alacritty" width="100%"><br><strong>Tikal</strong></td>
    <td align="center"><img src="screenshots/troy.png" alt="Troy in Neovim and Alacritty" width="100%"><br><strong>Troy</strong></td>
  </tr>
</table>

## Neovim

Install with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "1suo/findspot",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("findspot-alexandria")
  end,
}
```

Available names: `findspot-alexandria`, `findspot-babylon`, `findspot-knossos`, `findspot-petra`, `findspot-tikal`, `findspot-troy`.

## Other applications

| Port | Files | Status |
| --- | --- | --- |
| Neovim | `colors/` | Primary port |
| Alacritty | `ports/alacritty/` | Generated TOML palettes; captured in the gallery with Neovim |
| Obsidian | `theme.css`, `manifest.json` | One community theme with six optional Style Settings palettes |

**Alacritty:** import the palette you want from `ports/alacritty/` into your Alacritty configuration.

**Obsidian:** once the Community Directory listing is approved, install *Findspot* from Community Themes. The theme includes Alexandria, Babylon, Knossos, Petra, Tikal, and Troy. Install the optional [Style Settings](https://obsidian.md/plugins?id=obsidian-style-settings) plugin to switch palettes in *Settings → Style Settings → Findspot*. Alexandria and Knossos are light palettes; Babylon, Petra, Tikal, and Troy are dark. Match Obsidian's base color scheme to the selected palette.

The generated `ports/obsidian/` CSS files remain available as standalone snippets. The community theme package is assembled from those same generated files, with palette selectors scoped so they do not override one another.

## Palette source and development

The TOML files in `palettes/` are the source of truth. Generated files should not be edited by hand.

```sh
lua scripts/generate.lua
lua scripts/package-obsidian.lua
```

This regenerates the Neovim colorschemes, Alacritty palettes, Obsidian snippets, and palette composer. CI also packages `theme.css` and commits it with the other generated outputs.

## Obsidian releases

`manifest.json` is the version source for the Obsidian community theme. To publish an update, bump its `version` (SemVer `x.y.z`) and push a matching Git tag, for example `1.0.1`. The `Publish Obsidian theme release` workflow rebuilds `theme.css`, verifies that the tag matches the manifest, and creates a GitHub Release with `manifest.json` and `theme.css` attached.

The first Community Directory listing is a one-time manual submission: sign in at [community.obsidian.md](https://community.obsidian.md), connect the GitHub account that owns this repository, and submit the theme. Obsidian requires a genuine screenshot of the theme in the app for that listing; the terminal gallery images are not represented as Obsidian screenshots. After the listing is approved, matching GitHub Releases are how subsequent updates are delivered. See the [official submission guide](https://docs.obsidian.md/Themes/App%20themes/Submit%20your%20theme).

- [Open the palette composer](tools/composer.html)
- [Report a problem or request a port](https://github.com/1suo/findspot/issues)

## License

findspot is released under the [MIT License](LICENSE).

