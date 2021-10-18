import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';

class CapVaBac {
  int? cap;
  int? bac;
  CapVaBac(this.cap, this.bac);
}

class PhanTuSinhViewModel {
  StreamController<String> _nhanBinhPhuong = StreamController<String>();

  Stream<String> get nhanBinhPhuong => _nhanBinhPhuong.stream;

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
  void tinh(int n) {
    int minx=find_min_generator(n);
    List<int> a=[];
    for(int i=1;i<phi(n);i++){
     if(TinhA.UCLL(i, phi(n))==1){
       a.add(pown(minx, i, n));
      }
    }
    a.sort((a, b) => a.compareTo(b));
    _nhanBinhPhuong.sink.add('${a.toString()}');
  }
  int find_min_generator(int n){
    int phi_n = phi(n);
    List<int> a = prime_factors(phi_n);
    int check = 0;
    for(int i=2;i<=phi_n;i++) {
      for (var p in a) {
        if ((pown(i, (phi_n / p).toInt(), n)) == 1) {
          check = 0;
          break;
        }
        else {
          check = 1;
        }
      }
      if(check==1){
        return i;
      }
    }
    return -1;
  }
  // String list_generators_of_Zn(int j) {
  //   List<int> factors = prime_factors(j);
  //   // prime_factor = list(factors.keys())
  //
  //   exp = list(factors.values())
  //   if n ==
  //       2 or n == 4 or n == prime_factor[0]**exp[0] or n == 2*(prime_factor[0]**exp[0])
  //   :
  //   min_generator = find_min_generator(n)
  //   return f'tập các phần tử sinh của Z{n} là {sorted([pow(min_generator,i,n) for i in range(1,phi(n)) if math.gcd(i,phi(n)) == 1])}'
  //   return
  //   f
  //   "
  //   Z{n} không có phần tử sinh
  //   "
  // }
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
