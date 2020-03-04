import 'command_message.dart';

abstract class CommandBus {
  void dispatch<T>(CommandMessage<T> command);

  CommandSubscription subscribe<T>(Type commandType, CommandHandling<T> handler);
}

typedef CommandHandling<T> = dynamic Function(T command);

typedef CommandSubscription = bool Function();
