

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/state_type.dart';
import '../model/login_model.dart';
import '../repositories/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginRepository repository;

  LoginBloc({required this.repository}) : super(LoginState()){
    on<SubmitLogin>(_onSubmit);
    on<LoadLoginData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadLoginData event, Emitter<LoginState> emit)async{
    emit(state.copyWith(currentState: StateTypes.loading));
    try{
      var items = await repository.getAll();
      emit(state.copyWith(
        currentState: StateTypes.loaded,
        items: items,
        error: null,
      ));
    }
    catch(ex){
      emit(
        state.copyWith(
          currentState: StateTypes.error,
          error: "Error: ${ex}",
        ),
      );
    }
  }
  Future<void> _onSubmit(SubmitLogin event, Emitter<LoginState> emit)async{
    print("--------- on submit");
    emit(state.copyWith(currentState: StateTypes.submitting));
    try{
      var res = await repository.add(event.model);
      print("--------- login res ${res.email}");
      if(res!=  null){
        var shRe = await SharedPreferences.getInstance();
        await shRe.setString("email", res.email??"");
        await shRe.setString("name", res.name??"");
        await shRe.setInt("id", res.id??0);
        await shRe.setBool("login", true);
        emit(state.copyWith(
          currentState: StateTypes.submitted,
          error: null,
        ),

        );
      }
      else{
        emit(state.copyWith(
          currentState: StateTypes.error,
          error: "Error: Adding Field",
        ),);
      }
    }
    catch(ex){
      print("--------- logi ex ${ex}");
      emit(
        state.copyWith(
          currentState: StateTypes.error,
          error: "Exp: ${ex}",
        ),
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


class LoginState {
  final StateTypes currentState;
  final String? error;
  final List<LoginModel> items;

  LoginState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  LoginState copyWith({
    StateTypes? currentState,
    String? error,
    List<LoginModel>? items,
  }) {
    return LoginState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class LoginEvent {}

class SubmitLogin extends LoginEvent {
  final LoginModel model;

  SubmitLogin(this.model);
}

class LoadLoginData extends LoginEvent {}