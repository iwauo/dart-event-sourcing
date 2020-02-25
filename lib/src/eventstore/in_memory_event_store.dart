import 'package:dart_event_sourcing/src/eventstore/event_store.dart';

class InMemoryEventStore implements EventStore {
  @override
  int lastSequenceNumberFor(String aggregateIdentifier) {
    // TODO: implement lastSequenceNumberFor
    throw UnimplementedError();
  }

  @override
  void publish(List events) {
    // TODO: implement publish
  }

  @override
  Stream readsEvents(String aggregateIdentifier, {int firstSequenceNumber = 0}) {
    // TODO: implement readsEvents
    throw UnimplementedError();
  }

}