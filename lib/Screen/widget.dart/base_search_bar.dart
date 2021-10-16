import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseSearchBar extends StatelessWidget {
  final String title;
  const BaseSearchBar({Key? key, required this.title, this.focusNode,this.onSubmit, this.onChange, this.controller})
      : super(key: key);
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text('$title = ',style: TextStyle(fontSize: 20),),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                isCollapsed: true,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onChanged: (searchText) {
                onChange != null ? onChange!(searchText) : null;
              },
              onSubmitted: (searchText) {
                onSubmit != null ? onSubmit!(searchText) : null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
