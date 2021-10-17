import 'package:equatable/equatable.dart';

abstract class AffineEvent extends Equatable{

}
class MaHoaAffineEvent extends AffineEvent{
  final String banRo;
  final int keyA;
  final int keyB;

  MaHoaAffineEvent({required this.banRo,required this.keyA,required this.keyB});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banRo,  this.keyA,this.keyB];

}

class GiaiMaAffineEvent extends AffineEvent{
  final String banMa;
  final int keyA;
  final int keyB;

  GiaiMaAffineEvent({required this.banMa,required this.keyA,required this.keyB});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banMa,  this.keyA,this.keyB];
}