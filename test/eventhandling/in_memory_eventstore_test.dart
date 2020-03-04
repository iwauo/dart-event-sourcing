import 'package:test/test.dart';
import 'package:dart_event_sourcing/eventhandling.dart';

main() {
  group('InMemoryEventStore', () {
    EventStore eventStore;
    setUp(() {
      eventStore = InMemoryEventStore();
    });

    test('can store events and those events can be read afterwards.', () async {
      final eventMessage = DomainEventMessage.create("MESSAGE1");
      eventStore.publish([eventMessage]);
      final messages = await eventStore
          .readsEvents(eventMessage.aggregateIdentifier)
          .toList();
      expect(messages.length, 1);
      expect(messages[0].payload, "MESSAGE1");
    });
  });
}
