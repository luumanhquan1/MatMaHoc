import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';
class InPutMaxtrixHellMan extends StatelessWidget {
  final int i;
  final Function(String) onTap;
  const InPutMaxtrixHellMan({Key? key,required this.i,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSearchBar(
      title: 'A[$i]',
      onChange: (value){
        onTap(value);
      },
    );
  }
}
