import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';
import '../core/models/invoke_status.dart';

abstract class Interactor<P> {
  Stream<InvokeStatus> call(
    P params, {
    Duration timeout = defaultTimeout,
  }) async* {
    try {
      yield InvokeStarted();
      await doWork(params).timeout(
        timeout,
        onTimeout: () => throw TimeoutException(''),
      );
      yield InvokeSuccess();
    } catch (error) {
      yield InvokeError(error);
    }
  }

  @protected
  Future<void> doWork(P params);

  Future<void> executeSync(P params) async => doWork(params);

  static const Duration defaultTimeout = Duration(minutes: 5);
}

abstract class ResultInteractor<P, R> {
  Stream<R> call(P params) async* {
    yield await doWork(params);
  }

  @protected
  Future<R> doWork(P params);
}

abstract class SubjectInteractor<P, T> {
  final BehaviorSubject<P> _controller = BehaviorSubject<P>();

  void call(P params) => _controller.add(params);

  @protected
  Stream<T> createObservable(P params);

  ValueStream<T> observe() => _controller.switchMap(
        (P value) => createObservable(value),
      ) as ValueStream<T>;

  Future<void> dispose() async => await _controller.close();
}
