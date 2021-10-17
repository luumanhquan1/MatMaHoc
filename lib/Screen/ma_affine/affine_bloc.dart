import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'affine_event.dart';
import 'affine_state.dart';

class AffineBloc extends Bloc<AffineEvent, AffineState> {
  AffineBloc() : super(AffineState(ketQua: ''));
  final key = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  @override
  Stream<AffineState> mapEventToState(AffineEvent event) async* {
    if (event is MaHoaAffineEvent) {
      yield* _mapMaHoaEventToState(event);
    } else if (event is GiaiMaAffineEvent) {
      yield* _mapGiaiMaEventToState(event);
    }
  }

  Stream<AffineState> _mapMaHoaEventToState(MaHoaAffineEvent event) async* {
    List<String> banRo = event.banRo.split('');
    String banMa = '';
    banRo.forEach((element) {
      int oldChar = key.indexOf(element);
      log(oldChar.toString());
      int newChar = (oldChar * event.keyA + event.keyB) % 26;
      log(newChar.toString());
      banMa += key.elementAt(newChar);
    });
    log(banMa);
    yield state.update(ketQua: banMa);
  }

  Stream<AffineState> _mapGiaiMaEventToState(GiaiMaAffineEvent event) async* {
    List<String> banMa = event.banMa.split('');
    String banRo = '';
    int keyA = Euclide(26, event.keyA) < 0
        ? 26 + Euclide(26, event.keyA)
        : Euclide(26, event.keyA);
    log(keyA.toString());
    banMa.forEach((element) {
      int oldChar = key.indexOf(element);
      int newChar = (keyA * (oldChar - event.keyB)) % 26;
      banRo += key.elementAt(newChar);
    });
    log(banRo);
    yield state.update(ketQua: banRo);
  }

  int Euclide(int a, int b) {
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
      }
      d = a;
      x = x2;
      y = y2;
    }
    return y2;
  }
}
