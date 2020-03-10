import 'package:dart_event_sourcing/commandhandling.dart';
import 'package:dart_event_sourcing/eventhandling.dart';

abstract class AggregateProxy<T> {

  final T aggregate;

  AggregateProxy(
    this.aggregate,
  );

  void execute(void Function(T) action) => action(aggregate);

  dynamic handleCommand(CommandMessage command);

  dynamic handleEvent(DomainEventMessage event);

  String get identifierAsString;

  R invoke<R>(R Function(T) invocation) => invocation(aggregate);

  bool get deleted;

  Type get rootType;

  String get type;

  int get version;
}
