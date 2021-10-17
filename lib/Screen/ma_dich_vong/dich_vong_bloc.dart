import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_event.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_state.dart';

class DichVongBloc extends Bloc<DichVongEvent, DichVongState> {
  DichVongBloc() : super(DichVongState(ketQua: ''));
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
  Stream<DichVongState> mapEventToState(DichVongEvent event) async* {
    if (event is MaHoaDichVongEvent) {
      yield* _mapMaHoaEventToState(event);
    } else if (event is GiaiMaDichVongEvent) {
      yield* _mapGiaiMaEventToState(event);
    }
  }

  Stream<DichVongState> _mapMaHoaEventToState(MaHoaDichVongEvent event) async* {
    List<String> banRo = event.banRo.split('');
    String banMa = '';
    banRo.forEach((element) {
      int oldChar = key.indexOf(element);
      int newChar = (oldChar + event.key) % 26;
      banMa += key.elementAt(newChar);
    });
    log(banMa);
    yield state.update(ketQua: banMa);
  }

  Stream<DichVongState> _mapGiaiMaEventToState(
      GiaiMaDichVongEvent event) async* {
    List<String> banMa = event.banMa.split('');
    String banRo = '';
    banMa.forEach((element) {
      int oldChar = key.indexOf(element);
      int newChar = (oldChar - event.key) % 26;
      banRo += key.elementAt(newChar);
    });
    log(banRo);
    yield state.update(ketQua: banRo);
  }
}
