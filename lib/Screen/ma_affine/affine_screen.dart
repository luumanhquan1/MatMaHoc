import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_event.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_state.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

import 'affine_bloc.dart';
import 'affine_event.dart';
import 'affine_state.dart';

class MaAffineScreen extends StatelessWidget {
  MaAffineScreen({Key? key}) : super(key: key);

  final TextEditingController _banRoController = TextEditingController();

  final TextEditingController _banMaController = TextEditingController();
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AffineBloc>(
        create: (_) => AffineBloc(),
        child: BlocBuilder<AffineBloc, AffineState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar:  AppBar(
                title: Text('Mã Affine'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BaseSearchBar(
                      title: 'Bản rõ:',
                      controller: _banRoController,
                    ),
                    BaseSearchBar(
                      title: 'Bản mã:',
                      controller: _banMaController,
                    ),
                    BaseSearchBar(
                      title: 'a :',
                      controller: _aController,
                    ),
                    BaseSearchBar(
                      title: 'b :',
                      controller: _bController,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AffineBloc>(context).add(MaHoaAffineEvent(
                            banRo: _banRoController.text,
                            keyA: int.parse(_aController.text),
                            keyB: int.parse(_bController.text)));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text('Mã hóa'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AffineBloc>(context).add(
                            GiaiMaAffineEvent(
                                banMa: _banMaController.text,
                                keyA: int.parse(_aController.text),
                                keyB: int.parse(_bController.text)));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text('Giải mã'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        state.ketQua,
                        style: TextStyle(fontSize: 30.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
