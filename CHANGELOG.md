# 📜 Curtains
##### **WORK IN PROGRESS**
## **[0.9.3] - 24 APR 21**
- Divided package into two separate entities:
  - First is [`📜 Curtains`](https://pub.dev/packages/curtains), this package, for super simple scroll scrims.
  - 🆕 Now available individually to handle `Elevation` paradigm is [`👥 package:shadows`](https://pub.dev/packages/shadows).
    - Check it out for some neat [`Box`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)[`Shadow`](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowUtils.html) [utilities](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowsUtils.html) that mesh with 📜 `Curtains`.
- 🆕 Parameter: `color` for `Curtains`.
- `Curtains.elevation` parameter is now decoupled from the `key`s in `kElevationToShadow` as  [`Elevation.asBoxShadows`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html) will `lerp` if necessary.

## **[0.9.2] - 23 APR 21**
- 🐞 Bug fixed: `Curtains.regal` now properly respect initialized `duration` and `curve`.

## **[0.9.1] - 23 APR 21**
- 🆕 Parameter added: [`Curtains.clipBehavior`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/clipBehavior.html 'pub.dev Documentation: Curtains.clipBehavior')
  - Default (and previous) behavior: `Clip.hardEdge` for easy `BoxShadow` support (otherwise they bleed over)
  - Initialize `Clip.none` to alter Widget tree depth & remove [`ClipRect`](https://api.flutter.dev/flutter/widgets/ClipRect-class.html 'Flutter API ref doc: ClipRect') from 📜 Curtains

## **[0.9.0]/[0.9.0+1] - 23 APR 21**
- Initial release. Supports sound null-safety.
- One known 🐞 **bug**:
  - [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L319 '/example/lib/main.dart#L319'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L379 '/example/lib/main.dart#L379').
