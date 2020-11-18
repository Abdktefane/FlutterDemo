abstract class NetworkResult<T> {
  bool get isSuccess => this is Success || false;
  bool get isFailure => this is Failure || false;
  bool get isNetworkError => this is NetworkError || false;

  T getOrNull() => isSuccess ? (this as Success<T>).data : null;

  T getOrThrow() =>
      isSuccess ? (this as Success<T>).data : throw getException();

  Exception getException() {
    Exception ex;
    if (isFailure) {
      ex = (this as Failure<T>).cause;
    }
    if (isNetworkError) {
      ex = (this as NetworkError<T>).cause;
    }
    return ex;
  }
}

class Success<T> extends NetworkResult<T> {
  Success(this.data);

  final T data;

  @override
  String toString() => 'Success<$T}>:{$data}';
}

class Failure<T> extends NetworkResult<T> {
  Failure(this.cause);
  Exception cause;
  @override
  String toString() => 'Failure<$T>:{$cause}';
}

class NetworkError<T> extends NetworkResult<T> {
  NetworkError(this.cause);
  Exception cause;
  @override
  String toString() => 'NetworkError<$T>:{$cause}';
}
