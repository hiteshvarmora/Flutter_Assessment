import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  ListWidgetState createState() => ListWidgetState();
}

class ListWidgetState extends State<ListWidget> {
  List<int> itemCounts = List.generate(100, (_) => 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCounts.length,
      itemBuilder: (context, index) => ListItemWidget(
        count: itemCounts[index],
        onPressed: () {
          setState(() {
            itemCounts[index]++;
          });
        },
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;

  const ListItemWidget({
    Key? key,
    required this.count,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: onPressed,
            child: const Text(
              "+",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
