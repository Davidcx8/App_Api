enum Status { idle, loading, success, error }

class BaseState<T> {
  final Status status;
  final T? data;
  final String? errorMessage;

  BaseState({
    this.status = Status.idle,
    this.data,
    this.errorMessage,
  });

  BaseState<T> copyWith({
    Status? status,
    T? data,
    String? errorMessage,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
