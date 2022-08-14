

import 'dart:collection';

Context context = Context();


class Context<E> with ListMixin<E>{
  @override
  late int length;

  @override
  E operator [](Object index) {
    return Object() as E;
  }

  @override
  void operator []=(Object index, E value) {

  }

  void callMethod(String s, List<String> list) {}






}