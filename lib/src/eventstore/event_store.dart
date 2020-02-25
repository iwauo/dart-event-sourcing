abstract class EventStore {

    Stream<dynamic> readsEvents(
      String aggregateIdentifier, {int firstSequenceNumber = 0}
    );

    int lastSequenceNumberFor(String aggregateIdentifier);

    void publish(List<dynamic> events);
}