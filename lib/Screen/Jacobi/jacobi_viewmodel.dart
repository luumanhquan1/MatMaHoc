import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class JacoBiViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int a,int b) {

    _nhanBinhPhuong.sink.add(1);
  }

  int binhPhuong(int a, int k, int n, int i, List mg) {
    int b = 1;
    if (k == 0) {
      return b;
    }
    int A = a;
    if (mg[0] == 1) {
      b = a;
    }
    for (int j = 1; j < i; j++) {
      A = TinhA.mod(A * A, n);
      if (mg[j] == 1) {
        b = TinhA.mod(A * b, n);
      }
    }
    return b;
  }

  void dispose() {
    _nhanBinhPhuong.close();
  }
}
