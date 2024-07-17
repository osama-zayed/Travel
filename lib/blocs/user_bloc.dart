import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/users_model.dart';
import '../repositories/user_repository.dart';


class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository repository;

  UserBloc({required this.repository}) : super(UserState()){
    on<Submit>(_onSubmit);
    on<LoadUserData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadUserData event, Emitter<UserState> emit)async{
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
  Future<void> _onSubmit(Submit event, Emitter<UserState> emit)async{
    emit(state.copyWith(currentState: StateTypes.submitting));
    try{
      var res = await repository.add(event.model);
      if(res){
        emit(state.copyWith(
            currentState: StateTypes.submitted,
            error: null
        ));
      }
      else{
        emit(state.copyWith(
            currentState: StateTypes.error,
            error: "Error: Adding Field"
        ));
      }
    }
    catch(ex){
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Exp: ${ex}"
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


class UserState {
  final StateTypes currentState;
  final String? error;
  final List<UsersModel> items;

  UserState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  UserState copyWith({
    StateTypes? currentState,
    String? error,
    List<UsersModel>? items
  }) {
    return UserState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class UserEvent {}

class Submit extends UserEvent {
  final UsersModel model;

  Submit(this.model);
}

class LoadUserData extends UserEvent {}