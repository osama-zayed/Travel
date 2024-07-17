


import 'package:bilqis/repositories/my_trips_repository.dart';
import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/my_trips_model.dart';

class MyTripsBloc extends Bloc<MyTripsEvent, MyTripsState>{
  final MyTripsRepository repository;

  MyTripsBloc({required this.repository}) : super(MyTripsState()){
    //on<Submit>(_onSubmit);
    on<LoadTripsData>(_onLoadTripsData);
  }

  Future<void> _onLoadTripsData(LoadTripsData event, Emitter<MyTripsState> emit)async{
    emit(state.copyWith(currentState: StateTypes.loading));
    try{
      var items = await repository.getAll();
      emit(state.copyWith(
          currentState: StateTypes.loaded,
          items: items,
          error: null
      ));
    }
    catch(ex){
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Error: ${ex}"
          )
      );
    }
  }
// Future<void> _onSubmit(Submit event, Emitter<CategoryState> emit)async{
//   emit(state.copyWith(currentState: StateTypes.submitting));
//   try{
//     var res = await repository.add(event.model);
//     if(res){
//       emit(state.copyWith(
//           currentState: StateTypes.submitted,
//           error: null
//       ));
//     }
//     else{
//       emit(state.copyWith(
//           currentState: StateTypes.error,
//           error: "Error: Adding Field"
//       ));
//     }
//   }
//   catch(ex){
//     emit(
//         state.copyWith(
//             currentState: StateTypes.error,
//             error: "Exp: ${ex}"
//         )
//     );
//   }
// }

}


class MyTripsState {
  final StateTypes currentState;
  final String? error;
  final List<MyTripsModel> items;

  MyTripsState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  MyTripsState copyWith({
    StateTypes? currentState,
    String? error,
    List<MyTripsModel>? items
  }) {
    return MyTripsState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class MyTripsEvent {}

class Submit extends MyTripsEvent {
  final MyTripsModel model;

  Submit(this.model);
}

class LoadTripsData extends MyTripsEvent {}