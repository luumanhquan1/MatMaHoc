import 'package:equatable/equatable.dart';

abstract class VigenereEvent extends Equatable{

}
class MaHoaVigenereEvent extends VigenereEvent{
  final String banRo;
  final String key;

  MaHoaVigenereEvent({required this.banRo,required this.key});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banRo,  this.key];

}

class GiaiMaVigenereEvent extends VigenereEvent{
  final String banMa;
  final String key;

  GiaiMaVigenereEvent({required this.banMa,required this.key});

  @override
  // TODO: implement props
  List<Object?> get props => [this.banMa,  this.key];

}