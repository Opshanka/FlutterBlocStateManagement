import 'dart:async';

class CounterBloc {
  final StreamController<int> _streamController = StreamController<int>();
  StreamSink get _stateStreamSink => _streamController.sink;
  Stream<int> get stateStream => _streamController.stream;

  final StreamController<Event> _eventStreamController =
      StreamController<Event>();
  StreamSink get eventStreamSink => _eventStreamController.sink;
  Stream<Event> get _eventStream => _eventStreamController.stream;

  CounterBloc() {
    _eventStream.listen((event) {
      print(event);
      businessLogic(event);
    });
  }

  void businessLogic(Event event) {
    int? value;
    if (event is IncrementEvent) {
      value = event.value;
      value++;
    } else if (event is DecrementEvent) {
      value = event.value;
      value--;
    }

    _stateStreamSink.add(value);
  }
}

abstract class Event {}

class IncrementEvent extends Event {
  int value;
  IncrementEvent({required this.value});
}

class DecrementEvent extends Event {
  int value;
  DecrementEvent({required this.value});
}
