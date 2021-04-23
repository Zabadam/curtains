/// ## 📜 Curtains
/// Provides 📜 [Curtains] to wrap a scrollable
/// with scrim decorations while not at the start or end,
/// alluding to unrevealed content.
///
/// ### Reference
/// - Advanced usage with 📜 [Curtains.fancy] & 📜 [Curtains.regal]
/// - [Elevation]'s two static methods for passing
///   `double elevation` through [kElevationToShadow]
///   - [Elevation.asBoxShadows]`(elevation)`
///   - [Elevation.asBoxDecoration]`(elevation)`
/// - [Curtains.NILL] for `const BoxDecoration()`
/// - [_SensitivityList], a `List` extension for verifying a [Curtains.sensitivity]
library curtains;

export 'src/curtains.dart';
