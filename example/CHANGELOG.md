# 📜 Curtains Example
## **[1.0.1+2] - 23 APR 21**
### **Curtains [0.9.1]**
- Made the text on [`SourceCode()`](https://github.com/Zabadam/curtains/blob/main/example/lib/source_code.dart#L49 '/example/lib/source_code.dart#L49') view selectable.
  - Added [hint about this](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L130 '/example/lib/main.dart#L130') & pre-existing pinch-and-zoom interactivity in `AppBar(title: . . .)`
- Implement usage of 🆕 `Curtains [0.9.1]` parameter [`Curtains.clipBehavior`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/clipBehavior.html 'pub.dev Documentation: Curtains.clipBehavior') in penultimate demonstration `RegalCurtainsDemoHorizontal()` - '📜 Regal Curtains: Curtain Spread & clipBehavior'.
  - This demo already shows `BoxDecoration.gradient` necessitating non-negligible `Curtains.spread` in order to be visible
  - Now it also demonstrates why the default behavior is `Clip.hardEdge` for native simplicity in handling `Curtains.elevation` as `BoxShadow`
    - `BoxShadow`s do bleed over the `Curtains` extent with `Clip.none`; a `gradient` will not
    - `Clip.none` actually removes a `ClipRect` from Widget tree, altering depth

## **[1.0.0+1] - 23 APR 21**
### **Curtains [0.9.0+1]**
- Initial release. Supports sound null-safety.
- One known 🐞 **bug**:
  - [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L319 '/example/lib/main.dart#L319'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L379 '/example/lib/main.dart#L379').
