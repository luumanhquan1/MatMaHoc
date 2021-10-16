import 'dart:async';
import 'dart:developer';

import 'package:matmahoc/Heleper/tinh.dart';

class NhanBinhPhuongCoLapViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int a,int k,int n) {

    List<int> mg=List.generate(100, (index) => -1);
    int i=0;
    int coso=k;
    while(coso>0){
      mg[i]=coso%2;
      coso=(coso/2).floor();
      i++;
    }
    log('$a   $k   $n');
    _nhanBinhPhuong.sink.add(binhPhuong(a, k, n, i, mg));
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
