import 'package:equatable/equatable.dart';

abstract class DichVongEvent extends Equatable{

}
class MaHoaDichVongEvent extends DichVongEvent{
  final String banRo;
  final int key;

  MaHoaDichVongEvent({required this.banRo,required this.key});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banRo,  this.key];

}

class GiaiMaDichVongEvent extends DichVongEvent{
  final String banMa;
  final int key;

  GiaiMaDichVongEvent({required this.banMa,required this.key});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banMa,  this.key];

}