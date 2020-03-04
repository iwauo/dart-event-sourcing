import 'package:dynamic_properties/dynamic_properties.dart';
import 'package:uuid/uuid.dart';

abstract class DomainEventMessage<T> {
  String get aggregateIdentifier;
  int get sequenceNumber;
  DateTime get timestamp;
  T get payload;
  Type get payloadType;

  static DomainEventMessage<T> create<T>(
    T payload, {
    String aggregateIdentifier,
    int sequenceNumber,
    DateTime timestamp,
  }) =>
      _DomainEventMessage({
        "aggregateIdentifier": aggregateIdentifier ?? Uuid().toString(),
        "sequenceNumber": sequenceNumber ?? 0,
        "timestamp": timestamp ?? DateTime.now(),
        "payload": payload,
        "payloadType": payload.runtimeType,
      });
}

class _DomainEventMessage<T>
    with DynamicProperties
    implements DomainEventMessage<T> {
  _DomainEventMessage(Map<String, dynamic> props) {
    defineProperties(props);
  }
}
