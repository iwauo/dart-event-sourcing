import 'domain_event_message.dart';
import 'event_bus.dart';

abstract class EventStore extends EventBus {
  Stream<DomainEventMessage<dynamic>> readsEvents(String aggregateIdentifier,
      {int firstSequenceNumber = 0});

  int lastSequenceNumberFor(String aggregateIdentifier);
}
