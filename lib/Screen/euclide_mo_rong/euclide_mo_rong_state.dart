import 'package:equatable/equatable.dart';

class EMRState extends Equatable{
  // final String? banMa;
  // final String? banRo;
  // final int key;
  final String ketQua;

  EMRState(
      {required this.ketQua}); //EMRState({this.banMa, this.banRo,required this.key});

  EMRState update(
      {    String? ketQua,
      }
      )=> EMRState(ketQua: ketQua?? this.ketQua);

  @override
  // TODO: implement props
  List<Object?> get props => [ this.ketQua];

}