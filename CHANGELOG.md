# 📜 Curtains
## **[0.9.1] - 23 APR 21**
- 🆕 Parameter added: [`Curtains.clipBehavior`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/clipBehavior.html 'pub.dev Documentation: Curtains.clipBehavior')
  - Default (and previous) behavior: `Clip.hardEdge` for easy `BoxShadow` support (otherwise they bleed over)
  - Initialize `Clip.none` to alter Widget tree depth & remove [`ClipRect`](https://api.flutter.dev/flutter/widgets/ClipRect-class.html 'Flutter API ref doc: ClipRect') from 📜 Curtains

# 📜 Curtains
## **[0.9.0+1] - 23 APR 21**
- Initial release. Supports sound null-safety.
- One known 🐞 **bug**:
  - [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L319 '/example/lib/main.dart#L319'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L379 '/example/lib/main.dart#L379').
