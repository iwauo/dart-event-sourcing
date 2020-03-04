import 'package:test/test.dart';

import 'package:dart_event_sourcing/commandhandling.dart';

class GreetingCommand {
  String name;
  GreetingCommand(this.name);
  String get message => "Hello $name!";
}

class CountUpCommand {}

main() {
  group("SimpleCommandBus", () {
    CommandBus commandBus;
    setUp(() {
      commandBus = SimpleCommandBus();
    });

    test("dispatch commands to the registered command handlers.", () {
      List<String> greetings = [];
      int count = 0;
      final unsubscribeGreeting =
          commandBus.subscribe<GreetingCommand>(GreetingCommand, (command) {
        greetings.add(command.message);
        return greetings.length;
      });
      final unsubscribeCountUp =
          commandBus.subscribe<CountUpCommand>(CountUpCommand, (command) {
        count++;
        return count;
      });

      commandBus
        ..dispatch(CommandMessage.create(GreetingCommand("Alice")))
        ..dispatch(CommandMessage.create(GreetingCommand("Bob")))
        ..dispatch(CommandMessage.create(CountUpCommand()))
        ..dispatch(CommandMessage.create(CountUpCommand()))
        ..dispatch(CommandMessage.create(CountUpCommand()));

      unsubscribeCountUp();
      unsubscribeGreeting();

      commandBus
        ..dispatch(CommandMessage.create(GreetingCommand("HOGE")))
        ..dispatch(CommandMessage.create(CountUpCommand()))
        ..dispatch(CommandMessage.create(CountUpCommand()));

      expect(greetings, ["Hello Alice!", "Hello Bob!"]);
      expect(count, 3);
    });
  });
}
