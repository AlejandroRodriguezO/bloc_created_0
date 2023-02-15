// import 'dart:async';

import 'dart:async';

import 'package:bloc_pattern/pages/counter/bloc/counter_events.dart';

import '../../../state_management/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(
      _onIncrement,
    );
    on<DecrementEvent>(
      _onDecrement,
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(IncrementEvent(1));
    });
  }

  Timer? _timer;

  void _onIncrement(IncrementEvent event, Emitter<int> emit) {
    emit(state + event.factor);
  }

  void _onDecrement(DecrementEvent event, Emitter<int> emit) {
    emit(state - event.factor);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}





// // enum CounterEvent { decrement, increment }

// abstract class CounterEvent {
//   final int factor;

//   CounterEvent(this.factor);
// }

// class Increment extends CounterEvent {
//   Increment(super.factor);
// }

// class Decrement extends CounterEvent {
//   Decrement(super.factor);
// }

// class CounterBloc {
//   int _counter = 0;
//   int get counter => _counter;

//   final _controller = StreamController<int>.broadcast();

//   Stream<int> get stream => _controller.stream;

//   void add(CounterEvent event) {
//     // switch (event) {
//     //   case CounterEvent.decrement:
//     //     _emit(_counter - 1);
//     //     break;
//     //   case CounterEvent.increment:
//     //     _emit(_counter + 1);
//     //     break;
//     // }

//     if (event is Increment) {
//       _emit(_counter + event.factor);
//     } else if (event is Decrement) {
//       _emit(_counter - event.factor);
//     }
//   }

//   void _emit(int newCounter) {
//     if (newCounter != _counter) {
//       _counter = newCounter;
//       _controller.add(_counter);
//     }
//   }

//   void dispose() {
//     _controller.close();
//   }
// }
