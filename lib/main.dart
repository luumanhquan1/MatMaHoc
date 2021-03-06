import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/CapCuaPhanTu/cap_cua_phan_tu_screen.dart';
import 'package:matmahoc/Screen/GiaTriLonNhatZ83/gia_tri_lon_nhat_screen.dart';
import 'package:matmahoc/Screen/Jacobi/jacobi_screen.dart';
import 'package:matmahoc/Screen/MaHill/ma_hill_screen.dart';
import 'package:matmahoc/Screen/MaRSA/ma_rsa_screen.dart';
import 'package:matmahoc/Screen/Merkle_Hellman/merkle_hellman_screen.dart';
import 'package:matmahoc/Screen/MixColumn/mix_colunm_screen.dart';
import 'package:matmahoc/Screen/PhanTuSinhTrongZn/phan_tu_sinh_screen.dart';
import 'package:matmahoc/Screen/SingnelElgamal/singel_elgamal_screen.dart';
import 'package:matmahoc/Screen/TimNghicDao/tim_nghich_dao_screen.dart';
import 'package:matmahoc/Screen/ma_affine/affine_screen.dart';
import 'package:matmahoc/Screen/ma_dich_vong/ma_dich_vong_screen.dart';
import 'package:matmahoc/Screen/ma_vigenere/ma_vigenere_screen.dart';

import 'Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap.dart';
import 'Screen/euclide_mo_rong/euclide_mo_rong_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CellWidget(title: 'Nh??n b??nh ph????ng c?? l???p', onTap: (){
              Navigator.push(
                  context,
                  PageRouteBuilder(
                  pageBuilder: (_, __, ___) => NhanBinhPhuongCoLapScreen()),
              );
            }),
            CellWidget(title: 'Euclide m??? r???ng', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaEMRScreen()),
              );
            }),
            CellWidget(title: 'M?? RSA', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaRSAScreen()),
              );
            }),
            CellWidget(title: 'Gi?? tr??? l???n nh???t c???a Z*n', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => GiaTriLonNhatScreen()),
              );
            }),
            CellWidget(title: 'M?? hill', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaHillcreen()),
              );
            }),
            CellWidget(title: 'C???p c???a ph???n t??? trong Z(n)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => CapCuaPhanTuScreen()),
              );
            }),
            CellWidget(title: 'Ph???n t??? sinh trong Z(n)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => PhanTuSinhScreen()),
              );
            }),
            CellWidget(title: 'T??m ngh???ch ?????o', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => TimNghichDaoScreen()),
              );
            }),
            CellWidget(title: 'M?? d???ch v??ng', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaDichVongScreen()),
              );
            }),
            CellWidget(title: 'M?? Affine', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaAffineScreen()),
              );
            }),
            CellWidget(title: 'M?? Vigenere', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaVigenereScreen()),
              );
            }),
            CellWidget(title: 'T??nh jacobi(A/b)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => JacobiScreen()),
              );
            }),
            CellWidget(title: 'Signal Elgamal', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SingelElgamalScreen()),
              );
            }),
            CellWidget(title: 'Mix Colunm', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MixColumnScreen()),
              );
            }),
            CellWidget(title: 'Merkle_HellMan', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MerkleHellManScreen()),
              );
            }),

          ],
        ),
      )
    );
  }
}
class CellWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CellWidget({Key? key,required this.title,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}

