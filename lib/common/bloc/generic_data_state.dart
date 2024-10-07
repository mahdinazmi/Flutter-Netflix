abstract class GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data;
  DataLoaded({required this.data});
}

class FailureLoadData extends GenericDataState {
  final String errorMessage;
  FailureLoadData({required this.errorMessage});
}