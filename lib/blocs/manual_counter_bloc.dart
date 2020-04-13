import 'dart:async';

class ManualCounterBloc{

  int counter = 0;

  final _counterController = StreamController<int>();
  final _incrementCounterController = StreamController<int>();
  final _decrementCounterController = StreamController<int>();

  Stream<int> get counterStream => _counterController.stream;
  StreamSink<int> get counterController => _counterController.sink;
  StreamSink<int> get counterIncrement => _incrementCounterController.sink;
  StreamSink<int> get counterDecrement => _decrementCounterController.sink;

  ManualCounterBloc(){
    _counterController.add(counter);
    _incrementCounterController.stream.listen(incrementCounter);
    _decrementCounterController.stream.listen(decrementCounter);

  }

  incrementCounter(int counter){
    counter = counter+1;
    counterController.add(counter);
  }

  decrementCounter(int counter){
    counter = counter-1;
    counterController.add(counter);
  }


  void dispose(){
    _counterController.close();
  }

}