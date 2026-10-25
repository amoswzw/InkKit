# InkKit 墨具

The drawing and settings UI shared by [InkBar](https://github.com/amoswzw/InkBar) and
[InkStats](https://github.com/amoswzw/InkStats): two hand-made styles for macOS apps.

- **水墨 Ink-wash**: tapered brush strokes with ink bleed and dry-brush streaks, graded
  washes, rice paper and vermilion seals (`InkBrush`).
- **手绘 Excalidraw**: wobbly double-stroked lines and hachure fills, a partial Swift port of
  rough.js (`RoughGenerator`), set in Excalifont.

`Painter` draws chart primitives (lines, areas, gauges, outlines, dots, rules) in either
theme, and `Palette` holds each theme's colors in light and dark. For settings windows,
`InkSettingsShell` lays out a brush-lettered sidebar of pages on paper, with
`InkSectionHeader`, `InkList`, `InkSeal` and `InkRule` for the pieces; `Promo` composes
README screenshots.

## Using it

```swift
.package(url: "https://github.com/amoswzw/InkKit.git", from: "0.1.0")
```

Two conventions the apps follow:

- The theme is stored under the `theme` defaults key (`ink` or `sketch`); the settings shell
  and `ThemeID.current` read it from there.
- Excalifont ships in each app at `Contents/Resources/Fonts/Excalifont-Regular.ttf`; call
  `Fonts.registerBundled()` at launch. During development it is read from this package's
  `Resources/Fonts`. (A SwiftPM resource bundle isn't used: inside an `.app` its lookup
  misses and stops the process.)

To work on InkKit and an app together, point the app at a local checkout with
`swift package edit InkKit --path ../inkkit`, and `swift package unedit InkKit` afterwards.

## License

MIT. Includes a Swift port of rough.js (MIT) and Excalifont (SIL OFL 1.1); see
`THIRD_PARTY_NOTICES.md`.
