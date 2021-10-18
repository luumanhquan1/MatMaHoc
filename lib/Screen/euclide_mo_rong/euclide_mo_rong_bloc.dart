import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'euclide_mo_rong_event.dart';
import 'euclide_mo_rong_state.dart';
 

class EMRBloc extends Bloc<EMREvent, EMRState> {
  EMRBloc() : super(EMRState(ketQua: ''));
 

  @override
  Stream<EMRState> mapEventToState(EMREvent event) async* {
    if (event is TinhEMREvent) {
      yield* _mapMaHoaEventToState(event);
    }
  }

  Stream<EMRState> _mapMaHoaEventToState(TinhEMREvent event) async* {

    yield state.update(ketQua: Euclide(event.a, event.b));
  }


  String Euclide(int a, int b) {
    String ketQua ='';
    //='   q   r   x   y   a   b   x2   x1   y2   y1\n';
    int d, x, y, x1, x2, y1, y2 = 0, q, r;
    if (b == 0) {
      d = a;
      x = 1;
      y = 0;
    } else {
      x2 = 1;
      x1 = 0;
      y1 = 1;
      y2 = 0;
      while (b > 0) {
        q = (a / b).toInt();
        r = a - q * b;
        x = x2 - q * x1;
        y = y2 - q * y1;
        a = b;
        b = r;
        x2 = x1;
        x1 = x;
        y2 = y1;
        y1 = y;
     //   ketQua +='    ${q}    $r    $x    $y    $a    $b    $x2    $x1    $y2    $y1\n';
      }
      d = a;
      x = x2;
      y = y2;
    }
    ketQua+='x= $x\ny= $y\nd= $a\nNghịch đảo của a là $x\nNghịch đảo của b là $y\nLưu ý: nếu d khác 1 thì không có nghịch đảo';

    return ketQua;
  }
}
