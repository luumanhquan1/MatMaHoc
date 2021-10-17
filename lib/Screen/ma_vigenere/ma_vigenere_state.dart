import 'package:equatable/equatable.dart';

class VigenereState extends Equatable{
  // final String? banMa;
  // final String? banRo;
  // final int key;
  final String ketQua;

  VigenereState(
      {required this.ketQua}); //VigenereState({this.banMa, this.banRo,required this.key});

  VigenereState update(
      {    String? ketQua,
      }
      )=> VigenereState(ketQua: ketQua?? this.ketQua);

  @override
  // TODO: implement props
  List<Object?> get props => [ this.ketQua];

}