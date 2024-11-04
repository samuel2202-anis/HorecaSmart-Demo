import 'package:equatable/equatable.dart';

import '../../Data/Models/item_model.dart';

abstract class ApiState extends Equatable {
    @override
    List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
    final List<Item> items;

    ApiLoaded(this.items);

    @override
    List<Object> get props => [items];
}

class ApiError extends ApiState {
    final String message;

    ApiError(this.message);

    @override
    List<Object> get props => [message];
}