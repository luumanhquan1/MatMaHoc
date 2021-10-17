import 'package:equatable/equatable.dart';

class AffineState extends Equatable{

  final String ketQua;

  AffineState(
      {required this.ketQua});

  AffineState update(
      {    String? ketQua,
      }
      )=> AffineState(ketQua: ketQua?? this.ketQua);

  @override
  // TODO: implement props
  List<Object?> get props => [ this.ketQua];

}