import 'dart:async';
import 'dart:math';

class GiaTriLonNhatZViewModel {
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
        k = k - pow(2, i).toInt();
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

  void tinh(int a, int b, int n) {
    int k, y, t;
    k = 0;
    do {
      k++;
      y = nhanlap(a, k, n);
    } while (y != b);
_nhanBinhPhuong.sink.add(k);
  }
  void dispose() {
    _nhanBinhPhuong.close();
  }
}