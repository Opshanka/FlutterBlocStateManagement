import 'dart:async';

class CounterBloc {
  final StreamController<int> _streamController = StreamController<int>();
  StreamSink get stateStreamSink => _streamController.sink;
  Stream<int> get stateStream => _streamController.stream;

  final StreamController<int> _eventStreamController = StreamController<int>();
  StreamSink get eventStreamSink => _eventStreamController.sink;
  Stream<int> get _eventStream => _eventStreamController.stream;

  CounterBloc() {
    _eventStream.listen((event) {
      event++;
      stateStreamSink.add(event);
    });
  }
}
