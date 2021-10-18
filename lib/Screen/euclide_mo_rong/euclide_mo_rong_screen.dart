import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matmahoc/Screen/euclide_mo_rong/euclide_mo_rong_event.dart';

import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

import 'euclide_mo_rong_bloc.dart';
import 'euclide_mo_rong_state.dart';

class MaEMRScreen extends StatelessWidget {
  MaEMRScreen({Key? key}) : super(key: key);


  final TextEditingController _bController = TextEditingController();
  final TextEditingController _aController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EMRBloc>(
        create: (_) => EMRBloc(),
        child:
        BlocBuilder<EMRBloc, EMRState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar:  AppBar(
                title: Text('Euclide mở rộng'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    BaseSearchBar(
                      title: 'a:',
                      controller: _aController,
                    ),
                    BaseSearchBar(
                      title: 'b:',
                      controller: _bController,
                    ),

                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<EMRBloc>(context).add(
                            TinhEMREvent(
                               a:  int.parse(_aController.text),
                              b:  int.parse(_bController.text), ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text('Tính'),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        state.ketQua,
                        style: TextStyle(fontSize: 20.0),
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
