import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/BussinessLogic/ApiBloc/api_event.dart';
import 'package:horeca_smart/BussinessLogic/ApiBloc/api_state.dart';

import '../../Data/Repositories/data_repository.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
    final DataRepository _repository;

    ApiBloc(this._repository) : super(ApiInitial()) {
        on<FetchItems>((event, emit) async {
            emit(ApiLoading());
            try {
                final items = await _repository.fetchItems(event.collectionName);
                emit(ApiLoaded(items));
            } catch (e) {
                emit(ApiError(e.toString()));
            }
        });
    }
}