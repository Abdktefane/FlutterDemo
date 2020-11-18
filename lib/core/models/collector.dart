import 'dart:async';

import 'package:bloc/bloc.dart';

import 'invoke_status.dart';

mixin Collecter<E, S> on Bloc<E, S> {
  final List<StreamSubscription> subscriptions = <StreamSubscription>[];

  E lodingEvent();

  S lodingState();

  E errorEvent(TodoException ex);

  collect(Stream<InvokeStatus> stream) {
    final sub = stream.listen(_manageInvokeStatus);
    subscriptions.add(sub);
  }

  void _manageInvokeStatus(InvokeStatus status) {
    if (status is InvokeStarted) {
      add(lodingEvent());
    } else if (status is InvokeError) {
      add(errorEvent(status.throwable));
    }
  }
}

class TodoException implements Exception {
  TodoException(this.message);

  final String message;
}
