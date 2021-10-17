import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';
class KetQua{
  int? y;
  int? s;
  KetQua(this.y,this.s);
}
class SingelElgamalViewModel {
  StreamController<KetQua> _nhanBinhPhuong = StreamController<KetQua>();

  Stream<KetQua> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int p, int apha, int a,int x,int k) {
  int y=pown(apha, k, p);

    int s=(x - a*y)*Euclide(k, (p-1)) % (p-1);
    _nhanBinhPhuong.sink.add(KetQua(y,s));
  }
  int Euclide(int a,int b)
  {
    int luu=b;
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
    if(x2<0){
      return luu+x2;
    }
    return x2;
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