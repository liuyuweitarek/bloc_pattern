import 'dart:async';

import 'package:bloc_pattern/counter_event.dart';
class CounterBloc {
    int _counter = 0;

    CounterBloc() {
      _counterEventController.stream.listen(_mapEventToState);
    }

    // Manage counter state
    final StreamController<int> _counterStateController = StreamController<int>();
    StreamSink<int> get _counterStateSink => _counterStateController.sink;
    Stream<int> get counterStateStream => _counterStateController.stream;

    // Manage events
    final StreamController<CounterEvent> _counterEventController = StreamController<CounterEvent>();
    StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;
    
    void _mapEventToState(CounterEvent event) {
      if( event is IncrementEvent){
        _counter++;
      }else{
        _counter--;
      }
      _counterStateSink.add(_counter);
    }

    void dispose(){
      _counterStateController.close();
      _counterEventController.close();
    }
}