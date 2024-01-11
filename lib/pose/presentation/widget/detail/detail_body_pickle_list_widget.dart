import 'package:flutter/material.dart';

class DetailBodyPickleListWidget extends StatelessWidget {
  final List<String> pikleList;

  const DetailBodyPickleListWidget({super.key, required this.pikleList});

  @override
  Widget build(BuildContext context) {
    /// PickleList를 받고 뿌려줌
    return SizedBox(
      height: 224,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pikleList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Container(
              width: 126,
              height: 224,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(pikleList[index]),
            ),
          );
        },
      ),
    );
  }
}
