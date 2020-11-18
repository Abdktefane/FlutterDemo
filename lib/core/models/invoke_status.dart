import 'package:equatable/equatable.dart';

abstract class InvokeStatus extends Equatable {}

class InvokeStarted extends InvokeStatus {
  @override
  List<Object> get props => [];
}

class InvokeSuccess extends InvokeStatus {
  @override
  List<Object> get props => [];
}

class InvokeError extends InvokeStatus {
  final Exception throwable;
  InvokeError(this.throwable);
  @override
  List<Object> get props => [throwable.toString()];
}
