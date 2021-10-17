import 'package:equatable/equatable.dart';

class DichVongState extends Equatable{
  // final String? banMa;
  // final String? banRo;
  // final int key;
  final String ketQua;

  DichVongState(
      {required this.ketQua}); //DichVongState({this.banMa, this.banRo,required this.key});

  DichVongState update(
  {    String? ketQua,
    }
      )=> DichVongState(ketQua: ketQua?? this.ketQua);

  @override
  // TODO: implement props
  List<Object?> get props => [ this.ketQua];

}