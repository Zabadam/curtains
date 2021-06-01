/// Provides `Sensitivity` and named varieties
library curtains;

import 'package:flutter/foundation.dart';

/// Sensitivity corresponds to a tolerance amount at either the start or end
/// of a scrollable wrapped in `Curtains`.
class Sensitivity with Diagnosticable {
  /// Sensitivity corresponds to a tolerance amount at either the start or end
  /// of a scrollable wrapped in `Curtains`.
  ///
  /// The [start] and [end] sensitivities are the distance from the minimum or
  /// maximum extent at which the curtain will trigger its visibility change.
  ///
  /// Parameters are positional.
  /// - See also: [Sensitivity.only] and [Sensitivity.all]
  const Sensitivity(this.start, this.end)
      : assert(start >= 0 && end >= 0,
            '[Sensitivity] > Provide non-negative values');

  /// Sensitivity corresponds to a tolerance amount at either the start or end
  /// of a scrollable wrapped in `Curtains`.
  ///
  /// The [start] and [end] sensitivities are the distance from the minimum or
  /// maximum extent at which the curtain will trigger its visibility change.
  ///
  /// Default for each value is `0.0`.
  /// - See also: [Sensitivity.all] and [new Sensitivity]
  const Sensitivity.only({this.start = 0.0, this.end = 0.0})
      : assert(start >= 0 && end >= 0,
            '[Sensitivity] > Provide non-negative values');

  /// Sensitivity corresponds to a tolerance amount at either the start or end
  /// of a scrollable wrapped in `Curtains`.
  ///
  /// The [start] and [end] sensitivities are the distance from the minimum or
  /// maximum extent at which the curtain will trigger its visibility change.
  ///
  /// Parameter `sensitivity` is provided as both [start] and [end].
  /// - See also: [Sensitivity.only] and [new Sensitivity]
  const Sensitivity.all(double sensitivity)
      : start = sensitivity,
        end = sensitivity,
        assert(
            sensitivity >= 0, '[Sensitivity] > Provide a non-negative value');

  /// A `double` that corresponds to a tolerance amount in logical pixles
  /// at either the start or end of a scrollable wrapped in `Curtains`.
  ///
  /// This tolerance is the distance from the minimum or maximum extent
  /// at which the curtain will trigger its visibility change.
  ///
  /// Default is `0.0`.
  final double start, end;

  /// Preset `start` and `end` values of `10.0.`
  static const none = Sensitivity(0.0, 0.0);

  /// Preset `start` and `end` values of `10.0.`
  static const preset10 = Sensitivity(10.0, 10.0);

  /// Preset `start` and `end` values of `25.0.`
  static const preset25 = Sensitivity(25.0, 25.0);

  /// Preset `start` and `end` values of `50.0.`
  static const preset50 = Sensitivity(50.0, 50.0);

  /// Preset `start` and `end` values of `100.0.`
  static const preset100 = Sensitivity(100.0, 100.0);

  /// 📋 Provides a copy of this `Sensitivity` with either or
  /// both parameters replacing those of `this`.
  Sensitivity copyWith({double? start, double? end}) =>
      Sensitivity.only(start: start ?? this.start, end: end ?? this.end);

  @override
  void debugFillProperties(properties) {
    super.debugFillProperties(properties);
    properties
          ..add(DoubleProperty('@start', start))
          ..add(DoubleProperty('@end', end))
        //
        ;
  }
}
