import 'package:equatable/equatable.dart';

abstract class EMREvent extends Equatable{

}
class TinhEMREvent extends EMREvent{
  final int a;
  final int b;

  TinhEMREvent({required this.a,required this.b});

  @override
  // TODO: implement props
  List<Object?> get props => [this.a,  this.b];

}

