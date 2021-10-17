import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_event.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_state.dart';

import 'ma_vigenere_event.dart';
import 'ma_vigenere_state.dart';

class VigenereBloc extends Bloc<VigenereEvent, VigenereState> {
  VigenereBloc() : super(VigenereState(ketQua: ''));
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
  Stream<VigenereState> mapEventToState(VigenereEvent event) async* {
    if (event is MaHoaVigenereEvent) {
      yield* _mapMaHoaEventToState(event);
    } else if (event is GiaiMaVigenereEvent) {
      yield* _mapGiaiMaEventToState(event);
    }
  }

  Stream<VigenereState> _mapMaHoaEventToState(MaHoaVigenereEvent event) async* {
    List<int> arc = chuyenMaKey(event.key);
    List<int> dongkhoa = taoKhoa(event.banRo, arc);
    String banMa = maHoa(event.banRo, dongkhoa);
    yield state.update(ketQua: banMa);
  }

  Stream<VigenereState> _mapGiaiMaEventToState(
      GiaiMaVigenereEvent event) async* {
    List<int> arc = chuyenMaKey(event.key);
    List<int> dongkhoa = taoKhoa(event.banMa, arc);
    String banRo = giaiMa(event.banMa, dongkhoa);
    yield state.update(ketQua: banRo);
  }

  List<int> taoKhoa(String vao, List<int> keys) {
    List<String> banRo = vao.split('');
    List<int> plant = [];
    for (int i = 0; i < banRo.length; i++) {
      plant.add(0);
    }
    for (int i = 0; i < banRo.length; i++) {
      plant[i] = keys[(i % keys.length).toInt()];
    }
    return plant;
  }

  List<int> chuyenMaKey(String s) {
    List<String> banRo = s.split('');
    List<int> temp = [];
    List<int> roso = [];
    for (int i = 0; i < banRo.length; i++) {
      temp.add(0);
      roso.add(0);
    }
    int j = 0;
    while (j < banRo.length) {
      for (int i = 0; i < key.length; i++) {
        if (key[i] == banRo[j]) {
          roso[j] = i;
          temp[j] = roso[j];
        }
      }
      j++;
    }
    return temp;
  }

  String maHoa(String s, List<int> khoa) {
    List<String> banRo = s.split('');
    List<int> roso = [];
    List<String> temp = [];
    for (int i = 0; i < banRo.length; i++) {
      temp.add('');
      roso.add(0);
    }
    int maso;
    for (int j = 0; j < banRo.length; j++) {
      for (int i = 0; i < key.length; i++) {
        if (key[i] == banRo[j]) {
          roso[j] = i;
          maso = (roso[j] + khoa[j]) % 26;
          temp[j] = key[maso];
        }
      }
    }
    String ketqua = '';
    temp.forEach((element) {
      ketqua += element;
    });
    return ketqua;
  }

  String giaiMa(String s, List<int> khoa) {
    List<String> banMa = s.split('');
    List<int> roso = [];
    List<String> temp = [];
    for (int i = 0; i < banMa.length; i++) {
      temp.add('');
      roso.add(0);
    }
    int maso;
    for (int j = 0; j < banMa.length; j++) {
      for (int i = 0; i < key.length; i++) {
        if (key[i] == banMa[j]) {
          roso[j] = i;
          log((roso[j] + 26 - khoa[j]).toString());
          maso = (roso[j] + 26 - khoa[j]) % 26;
          temp[j] = key[maso];
        }
      }
    }
    String ketqua = '';
    temp.forEach((element) {
      ketqua += element;
    });
    return ketqua;
  }
}
