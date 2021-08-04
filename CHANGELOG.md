# 📜 Curtains
##### **WORK IN PROGRESS**
## **[0.10.0] - 31 MAY 21**
- Code and documentation cleanup.
- Constructor and parameter alterations:
  
> | <h3 style='color:green'>**[0.10.0] (now)**</h3> |   ⬅️   | <h3 style='color:red'>**[0.9.4+1] (before)**</h3> | \|   | <h3 style='color:green'>**[0.10.0] (now)**</h3> | ⬅️    | <h3 style='color:red'>**[0.9.4+1] (before)**</h3> |
> | :---------------------------------------------- | :---: | :------------------------------------------------ | :--- | :---------------------------------------------- | :--- | :------------------------------------------------ |
> | `Curtains`                                      |       | `Curtains.regal`                                  | \|   | `Sensitivity sensitivity`                       |      | `List<double> sensitivity`                        |
> | `Curtains.instant`                              |       | `Curtains.fancy`                                  | \|   | `TextDirection textDirection`                   |      | `TextDirection directionality`                    |
> | `Curtains.elevated`                             |       | `Curtains`                                        | \|   | `bool endInitVisible` ⭐                         |      | `bool endCurtainInitVisible`                      |
> 
> ⭐ Also now available is `bool startInitVisible`.
> <br /><br />
> Furthermore either `startCurtain` or `endCurtain` [now accepts a more
> abstract `Decoration?`](https://pub.dev/packages/curtains/#any-decoration-table-of-contents-scroll-up-to--table-of-contents) \
> as opposed to the restriction to `BoxDecoration?`.
<br />

## **[0.9.4+1] - 04 MAY 21**
- Removed erroneous `print()`

## **[0.9.4] - 30 APR 21**
- Added 🆕 parameters: `endCurtainInitVisible`, which should be self explanatory; and `alignment`, similarly so.

## **[0.9.3+1] - 25 APR 21**
- Corrected `export 'package:flutter/widgets.dart';`.

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
