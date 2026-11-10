# findspot

Six color schemes for Neovim, with matching exports for Alacritty and Obsidian.

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
| Obsidian | `ports/obsidian/` | Community CSS snippets; experimental, not yet verified against every Obsidian view |

**Alacritty:** import the palette you want from `ports/alacritty/` into your Alacritty configuration.

**Obsidian:** copy a `.css` file from `ports/obsidian/` to your vault's `.obsidian/snippets/` directory. Enable it in *Settings → Appearance → CSS snippets*. The Alexandria, Knossos, and Tikal palettes are light; Babylon, Petra, and Troy are dark. Set Obsidian's base color scheme to match the snippet.

Obsidian snippets style the app's theme variables and selected editor/preview elements. Plugins and community themes can override individual rules; this is not a full replacement for an Obsidian theme.

## Palette source and development

The TOML files in `palettes/` are the source of truth. Generated files should not be edited by hand.

```sh
lua scripts/generate.lua
```

This regenerates the Neovim colorschemes, Alacritty palettes, Obsidian snippets, and palette composer. CI captures the six terminal screenshots from the generated outputs.

- [Open the palette composer](tools/composer.html)
- [Report a problem or request a port](https://github.com/1suo/findspot/issues)

