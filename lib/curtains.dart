/// ## 📜 Curtains Library
/// ## [pub.dev Listing](https://pub.dev/packages/curtains) | [API Doc](https://pub.dev/documentation/curtains/latest) | [GitHub](https://github.com/Zabadam/curtains)
/// #### API References: [`Curtains`](https://pub.dev/documentation/curtains/latest/curtains/Curtains-class.html) | 👥 [`package:shadows`](https://pub.dev/packages/shadows): 🕴 [`Elevation`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxDecoration.html)
///
/// Provides super simple scrim 📜 `Curtains`, or shadow decorations, \
/// by wrapping a scrollable child, alluding to unrevealed content \
/// while not at the start or end.
///
/// ### Reference
/// - `Elevation` paradigm handled by [`👥 package:shadows`](https://pub.dev/packages/shadows)
///   - Check it out for some neat [`Box`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)[`Shadow`](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowUtils.html) [utilities](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowsUtils.html) that mesh with 📜 `Curtains`
library curtains;

export 'package:shadows/shadows.dart';

export 'src/models/sensitivity.dart';
export 'src/widgets/curtains.dart';
