import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
    @override
    List<Object> get props => [];
}

class FetchItems extends ApiEvent {
    final String collectionName;

    FetchItems(this.collectionName);

    @override
    List<Object> get props => [collectionName];
}