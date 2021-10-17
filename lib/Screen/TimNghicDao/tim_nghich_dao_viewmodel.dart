import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class TimNghichDaoViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int a,int b) {
    int Euclide(int a,int b)
    {
      int q,r,x,y;
      int x1=0;
      int x2=1;
      int y2=0;
      int y1=1;
      while(b>0)
      {
        q=(a/b).floor();
        r=a-q*b;
        x=x2-x1*q;
        y=y2-y1*q;
        a=b;
        b=r;
        x2=x1;
        x1=x;
        y2=y1;
        y1=y;
        if(b<=0){
          break;
        }
      }
      _nhanBinhPhuong.sink.add(x2);
      return TinhA.mod(x1,b);
    }
    
    _nhanBinhPhuong.sink.add(Euclide(a, b));
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
