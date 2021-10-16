import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';
class InPutMaxtrix extends StatelessWidget {
  final int i,j;
  final Function(String) onTap;
  const InPutMaxtrix({Key? key,required this.i,required this.j,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSearchBar(
      title: 'A[$i][$j]',
      onChange: (value){
        onTap(value);
      },
    );
  }
}
