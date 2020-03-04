import 'domain_event_message.dart';

abstract class EventBus {
  void publish(List<DomainEventMessage<dynamic>> events);
}
