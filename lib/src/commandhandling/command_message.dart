import 'package:uuid/uuid.dart';
import 'package:dynamic_properties/dynamic_properties.dart';

abstract class CommandMessage<T> {
  String get aggregateIdentifier;
  int get sequenceNumber;
  DateTime get timestamp;
  T get payload;
  Type get payloadType;

  static CommandMessage<T> create<T>(
    T payload, {
    String aggregateIdentifier,
    int sequenceNumber,
    DateTime timestamp,
  }) =>
      _CommandMessage<T>({
        "aggregateIdentifier": aggregateIdentifier ?? Uuid().toString(),
        "sequenceNumber": sequenceNumber ?? 0,
        "timestamp": timestamp ?? DateTime.now(),
        "payload": payload,
        "payloadType": payload.runtimeType,
      });
}

class _CommandMessage<T> with DynamicProperties implements CommandMessage<T> {
  _CommandMessage(Map<String, dynamic> props) {
    defineProperties(props);
  }
}
