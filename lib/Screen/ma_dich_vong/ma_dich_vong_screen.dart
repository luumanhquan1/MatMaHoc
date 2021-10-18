import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_bloc.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_event.dart';
import 'package:matmahoc/Screen/ma_dich_vong/dich_vong_state.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class MaDichVongScreen extends StatelessWidget {
  MaDichVongScreen({Key? key}) : super(key: key);

  final TextEditingController _banRoController = TextEditingController();

  final TextEditingController _banMaController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DichVongBloc>(
        create: (_) => DichVongBloc(),
        child:
            BlocBuilder<DichVongBloc, DichVongState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar:  AppBar(
                title: Text('Mã Dịch Vòng'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
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
                      title: 'Khóa :',
                      controller: _keyController,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<DichVongBloc>(context).add(
                            MaHoaDichVongEvent(
                                banRo: _banRoController.text,
                                key: int.parse(_keyController.text)));
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
                        BlocProvider.of<DichVongBloc>(context).add(
                            GiaiMaDichVongEvent(
                                banMa: _banMaController.text,
                                key: int.parse(_keyController.text)));
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
