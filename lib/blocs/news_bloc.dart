

import 'package:bilqis/repositories/news_repository.dart';
import 'package:bloc/bloc.dart';

import '../Helpers/state_type.dart';
import '../model/news_model.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState>{
  final NewsRepository repository;

  NewsBloc({required this.repository}) : super(NewsState()){
    //on<Submit>(_onSubmit);
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadData event, Emitter<NewsState> emit)async{
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


class NewsState {
  final StateTypes currentState;
  final String? error;
  final List<NewsModel> items;

  NewsState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  NewsState copyWith({
    StateTypes? currentState,
    String? error,
    List<NewsModel>? items
  }) {
    return NewsState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class NewsEvent {}

class Submit extends NewsEvent {
  final NewsModel model;

  Submit(this.model);
}

class LoadData extends NewsEvent {}