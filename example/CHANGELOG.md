# 📜 Curtains Demo
## **[1.0.3+4] - 31 MAY 21**
### **Curtains [0.10.0]**
- Updated references to new names.

## **[1.0.2+3] - 24 APR 21**
### **Curtains [0.9.3]**
- Seeing as 👥 [`package:shadows`](https://pub.dev/packages/shadows) is
  included with the Example app, show it off a bit in the second demo.

## **[1.0.1+2] - 23 APR 21**
### **Curtains [0.9.1]**
- Made the text on [`SourceCode()`](https://github.com/Zabadam/curtains/blob/main/example/lib/source_code.dart#L50 '/example/lib/source_code.dart#L50') view selectable.
  - Added [hint about this](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L141 '/example/lib/main.dart#L141') & pre-existing pinch-and-zoom interactivity in `AppBar(title: . . .)`
- Implement usage of 🆕 `Curtains [0.9.1]` parameter [`Curtains.clipBehavior`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/clipBehavior.html 'pub.dev Documentation: Curtains.clipBehavior') in penultimate demonstration `RegalCurtainsDemoHorizontal()` - '📜 Regal Curtains: Curtain Spread & clipBehavior'.
  - This demo already shows `BoxDecoration.gradient` necessitating non-negligible `Curtains.spread` in order to be visible
  - Now it also demonstrates why the default behavior is `Clip.hardEdge` for native simplicity in handling `Curtains.elevation` as `BoxShadow`
    - `BoxShadow`s do bleed over the `Curtains` extent with `Clip.none`; a `gradient` will not
    - `Clip.none` actually removes a `ClipRect` from Widget tree, altering depth

## **[1.0.0+1] - 23 APR 21**
### **Curtains [0.9.0+1]**
- Initial release. Supports sound null-safety.
- One known 🐞 **bug**:
  1. [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L344 '/example/lib/main.dart#L344'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L408 '/example/lib/main.dart#L408').
