

import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/airport_model.dart';
import '../repositories/airport_repository.dart';


class AirportBloc extends Bloc<AirportEvent, AirportState>{
  final AirportRepository repository;

  AirportBloc({required this.repository}) : super(AirportState()){
    //on<Submit>(_onSubmit);
    on<LoadAirportData>(_onLoadAirportData);
  }

  Future<void> _onLoadAirportData(LoadAirportData event, Emitter<AirportState> emit)async{
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


class AirportState {
  final StateTypes currentState;
  final String? error;
  final List<AirportModel> items;

  AirportState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  AirportState copyWith({
    StateTypes? currentState,
    String? error,
    List<AirportModel>? items
  }) {
    return AirportState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class AirportEvent {}

class Submit extends AirportEvent {
  final AirportModel model;

  Submit(this.model);
}

class LoadAirportData extends AirportEvent {}