import 'dart:math';

import 'package:dart_event_sourcing/modeling.dart';
import 'package:test/test.dart';

@Aggregate()
class SampleAggregate {
  static const String _objectId = "SAMPLE_ID";
  @AggregateIdentifier()
  String get objectId => _objectId;
}

main() {
  group("An annotated class", () {
    test("can create an instance", () {
      final obj = SampleAggregate();
      expect(obj.objectId, "SAMPLE_ID");
    });
  });
}
