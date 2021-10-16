import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class MaRSAViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  int nhanlap(int a, int d, int n) {
    int mu = 0, k = d;
    List<int?> ki = List.generate(100, (index) => null);
    while (k >= pow(2, mu)) {
      mu++;
    }
    mu = mu - 1;
    for (int i = mu; i >= 0; i--) {
      if (k >= pow(2, i)) {
        int pw = pow(2, i).toInt();
        k = k - pw;
        ki[i] = 1;
      } else {
        ki[i] = 0;
      }
    }
    int b = 1;
    if (d == 0) {
      return b;
    }
    int A = a;
    if (ki[0] == 1) {
      b = a;
    }
    for (int i = 1; i <= mu; i++) {
      A = (A * A) % n;
      if (ki[i] == 1) {
        b = (A * b) % n;
      }
    }
    return b;
  }

  int mod(int a, int b) {
    int k = (a / b).floor();
    if (a >= 0) {
      if (k == 0) {
        return a;
      } else {
        return a - (k * b);
      }
    } else {
      while (a < 0) {
        a = a + b;
      }
      return a;
    }
  }

  int Euclide(int a, int p) {
    int q, r, x;
    int u = a;
    int v = p;
    int x1 = 1;
    int x2 = 0;
    while (u != 1) {
      q = (v / u).floor();
      r = v - q * u;
      x = x2 - x1 * q;
      v = u;
      u = r;
      x2 = x1;
      x1 = x;
    }
    return mod(x1, p);
  }

  void tinh(int q, int b, int e,int c) {
      int phi;

  int n = b*q;
  phi = (b-1)*(q-1);
  int d= Euclide(e,phi);

    _nhanBinhPhuong.sink.add(nhanlap(c,d,n));
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
