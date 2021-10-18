import 'dart:async';
import 'dart:developer';
//import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class JacoBiViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int a,int b) {
   List<int> x = [a,b];
   int dauTru = 0;
   String kq='';

 log(gcd(x[0],x[1]).toString());
  if(gcd(x[0],x[1])==1)
    {
      log('aaaa');
      while (x[0] != 1 && x[1] % 2 == 1) {
        if (x[0] > x[1]) {
          x = [(x[0] % x[1]), x[1]];
        }else if(x[0] < x[1] && x[0] % 2 == 1){
          if(x[0] % 4 == 3 && x[1] % 4 == 3){
            dauTru += 1;
          }
          x = [x[1], x[0]];
        }else if(x[0] % 2 == 0){
          if(x[1] % 8 == 3 || x[1] % 8 == 5){
            dauTru += 1;
          }
          x = [(x[0] / 2).floor(), x[1]];
        }
      }
      if(dauTru%2==1){
        kq='-1';
      }else{
        kq='1';
      }
    }
  else{
    log('aaaa');
    kq='0';
  }


   print('>>>>>>>>   $kq');
    _nhanBinhPhuong.sink.add(int.parse(kq));
  }

  int gcd(int a, int b){
    log('lllll');
    if (a == 0 || b == 0){
      return a + b;
    }
    while (a != b){
      if (a > b){
        a -= b; // a = a - b
      }else{
        b -= a;
      }
    }
    return a; // return a or b, bởi vì lúc này a và b bằng nhau
  }

  void dispose() {
    _nhanBinhPhuong.close();
  }
}
