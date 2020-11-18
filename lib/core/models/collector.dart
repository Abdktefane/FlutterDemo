import 'dart:async';

import 'package:bloc/bloc.dart';

import 'invoke_status.dart';

mixin Collecter<E, S> on Bloc<E, S> {
  final List<StreamSubscription> subscriptions = <StreamSubscription>[];

  E lodingEvent();

  S lodingState();

  E errorEvent(Exception ex);

  S errorState(Exception ex);

  collect(Stream<InvokeStatus> stream) {
    final sub = stream.listen(_manageInvokeStatus);
    subscriptions.add(sub);
  }

  void _manageInvokeStatus(InvokeStatus status) {
    if (status is InvokeStarted) {
    } else if (status is InvokeError) {
      add(errorEvent(status.throwable));
    }
  }
}
