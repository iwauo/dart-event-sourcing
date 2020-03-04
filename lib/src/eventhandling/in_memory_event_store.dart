import 'event_store.dart';
import 'domain_event_message.dart';

class InMemoryEventStore implements EventStore {
  Map<String, List<DomainEventMessage<dynamic>>> _events = {};

  @override
  int lastSequenceNumberFor(String aggregateIdentifier) {
    final events = _events[aggregateIdentifier];
    return events?.length ?? 0;
  }

  @override
  void publish(List<DomainEventMessage<dynamic>> events) {
    events.forEach((event) {
      final key = event.aggregateIdentifier;
      if (!_events.containsKey(key)) {
        _events[key] = [];
      }
      _events[key].add(event);
    });
  }

  @override
  Stream<DomainEventMessage<dynamic>> readsEvents(String aggregateIdentifier,
      {int firstSequenceNumber = 0}) {
    if (_events.containsKey(aggregateIdentifier)) {
      return Stream.fromIterable(_events[aggregateIdentifier]);
    }
    return Stream.empty();
  }
}
