

import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/route_model.dart';
import '../repositories/route_repository.dart';


class RouteBloc extends Bloc<RouteEvent, RouteState>{
  final RouteRepository repository;

  RouteBloc({required this.repository}) : super(RouteState()){
    //on<Submit>(_onSubmit);
    on<LoadRouteData>(_onLoadRouteData);
  }

  Future<void> _onLoadRouteData(LoadRouteData event, Emitter<RouteState> emit)async{
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


class RouteState {
  final StateTypes currentState;
  final String? error;
  final List<RouteModel> items;

  RouteState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  RouteState copyWith({
    StateTypes? currentState,
    String? error,
    List<RouteModel>? items
  }) {
    return RouteState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class RouteEvent {}

class Submit extends RouteEvent {
  final RouteModel model;

  Submit(this.model);
}

class LoadRouteData extends RouteEvent {}