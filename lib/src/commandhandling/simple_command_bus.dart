import 'command_message.dart';
import 'command_bus.dart';

class SimpleCommandBus implements CommandBus {
  Map<Type, Function> handlers = {};

  @override
  void dispatch<T>(CommandMessage<T> command) {
    Type commandType = command.payloadType;
    CommandHandling<T> commandHandler = handlers[commandType];
    if (commandHandler == null) return;
    commandHandler(command.payload);
  }

  @override
  CommandSubscription subscribe<T>(
      Type commandType, CommandHandling<T> handler) {
    handlers[commandType] = handler;
    return () => handlers[commandType] = null;
  }
}
