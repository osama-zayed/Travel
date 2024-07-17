

import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/plane_model.dart';
import '../repositories/plane_repository.dart';

class PlaneBloc extends Bloc<PlaneEvent, PlaneState>{
  final PlaneRepository repository;

  PlaneBloc({required this.repository}) : super(PlaneState()){
    //on<Submit>(_onSubmit);
    on<LoadPlaneData>(_onLoadPlaneData);
  }

  Future<void> _onLoadPlaneData(LoadPlaneData event, Emitter<PlaneState> emit)async{
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


class PlaneState {
  final StateTypes currentState;
  final String? error;
  final List<PlaneModel> items;

  PlaneState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  PlaneState copyWith({
    StateTypes? currentState,
    String? error,
    List<PlaneModel>? items
  }) {
    return PlaneState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class PlaneEvent {}

class Submit extends PlaneEvent {
  final PlaneModel model;

  Submit(this.model);
}

class LoadPlaneData extends PlaneEvent {}