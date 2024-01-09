import 'package:flutter/material.dart';

class SelfCareTextField extends StatelessWidget {
  const SelfCareTextField({
    super.key,
    required FocusNode nameNode,
    required TextEditingController nameController,
  }) : _nameNode = nameNode, _nameController = nameController;

  final FocusNode _nameNode;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        color: _nameNode.hasFocus
            ? MaeumgagymColor.blue50
            : MaeumgagymColor.gray25,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: _nameNode.hasFocus ? MaeumgagymColor.blue100 : MaeumgagymColor.gray50,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: _nameController,
          focusNode: _nameNode,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            overflow: TextOverflow.visible,
            decorationThickness: 0,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          cursorColor: MaeumgagymColor.blue600,
        ),
      ),
    );
  }
}

