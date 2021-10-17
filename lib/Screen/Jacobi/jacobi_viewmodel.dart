import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class JacoBiViewModel {
  StreamController<int> _nhanBinhPhuong = StreamController<int>();

  Stream<int> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int a,int b) {
   List<int> x = [a,b];
   int dauTru = 0;
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
    String kq='';
    if(dauTru%2==1){
      kq='-1';
    }else{
      kq='1';
    }
   print('>>>>>>>>   $kq');
    _nhanBinhPhuong.sink.add(int.parse(kq));
  }



  void dispose() {
    _nhanBinhPhuong.close();
  }
}
