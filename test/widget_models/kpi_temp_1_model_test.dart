import 'package:flutter_test/flutter_test.dart';
import 'package:logistics_dashboard/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('KpiTemp1Model Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
