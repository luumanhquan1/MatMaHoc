import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';

class CapVaBac {
  int? cap;
  int? bac;
  CapVaBac(this.cap, this.bac);
}

class CapCuaPhanTuViewModel {
  StreamController<List<CapVaBac>> _nhanBinhPhuong = StreamController<List<CapVaBac>>();

  Stream<List<CapVaBac>> get nhanBinhPhuong => _nhanBinhPhuong.stream;

  void tinh(int n) {
    List<int> prime_factors(int n) {
      List<int> a = [];
      int i = 2;
      while (n > 1) {
        if (n % i == 0) {
          if (a.contains(i) == false) {
            a.add(i);
          }
          n = (n / i).toInt();
        } else {
          i++;
        }
      }
      return a;
    }

    int phi(int n) {
      double phi_n = n.toDouble();
      for (var i in prime_factors(n)) {
        phi_n *= (1.0 - (1.0 / i.toDouble()));
      }
      return phi_n.toInt();
    }

    List<int> list_element_Zn(int n) {
      List<int> a = [];
      for (int i = 0; i < n; i++) {
        if (TinhA.UCLL(i, n) == 1) {
          a.add(i);
        }
      }
      return a;
    }

    int order_of_element_a_in_Zn(int a, int n) {
      int phi_n = phi(n);
      for (int i = 1; i < phi_n + 1; i++) {
        if (phi_n % i == 0) {
          if (pown(a, i, n) == 1) {
            return i;
          }
        }
      }
      return 0;
    }

    List<CapVaBac> list=[];
    for (var vl in list_element_Zn(n)) {
      list.add(CapVaBac(vl, order_of_element_a_in_Zn(vl, n)));
    }

    _nhanBinhPhuong.sink.add(list);
  }

  int pown(int a, int k, int n) {
    List<int> mg = List.generate(100, (index) => -1);
    int i = 0;
    int coso = k;
    while (coso > 0) {
      mg[i] = coso % 2;
      coso = (coso / 2).floor();
      i++;
    }
    return binhPhuong(a, k, n, i, mg);
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
