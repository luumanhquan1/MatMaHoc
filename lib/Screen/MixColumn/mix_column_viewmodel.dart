import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';

class KetQua {
  int? y;
  int? s;
  KetQua(this.y, this.s);
}

class MixColunmViewModel {
  StreamController<String> _nhanBinhPhuong = StreamController<String>();

  Stream<String> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void mixColum(int a, int b, int c, int d) {
    mixColumns(a, b, c, d);
  }

  void mixColumns(a, b, c, d) {
    String value = printHex(gmul(a, 2) ^ gmul(b, 3) ^ gmul(c, 1) ^ gmul(d, 1)) +" "+
        printHex(gmul(a, 1) ^ gmul(b, 2) ^ gmul(c, 3) ^ gmul(d, 1)) +" "+
        printHex(gmul(a, 1) ^ gmul(b, 1) ^ gmul(c, 2) ^ gmul(d, 3)) +" "+
        printHex(gmul(a, 3) ^ gmul(b, 1) ^ gmul(c, 1) ^ gmul(d, 2));
  _nhanBinhPhuong.sink.add(value);
  }

  int gmul(int a, int b) {
    if (b == 1) {
      return a;
    }
    int tmp = (a << 1) & 0xff;
    if (b == 2) {
      if (a < 128) {
        return tmp;
      } else {
        return (tmp ^ 0x1b);
      }
    }
    if (b == 3) {
      return gmul(a, 2) ^ a;
    }
    return -1;
  }

  String printHex(int val) {
    return val.toRadixString(16);
  }

  // return print('{:02x}'.format(val), end=' ')
  void dispose() {
    _nhanBinhPhuong.close();
  }
}
