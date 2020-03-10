import 'aggregate_proxy.dart';
abstract class Repository<T> {
  AggregateProxy<T> load(String aggregateIdentifier, {int expectedVersion = null});
  AggregateProxy<T> newInstance(T Function() factoryMethod);
}