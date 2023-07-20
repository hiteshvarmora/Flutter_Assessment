import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  ListWidgetState createState() => ListWidgetState();
}

class ListWidgetState extends State<ListWidget> {
  late ScrollController _scrollController;
  List<int> itemCounts = List.generate(100, (_) => 0);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _resetFirstItem();
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        _resetFirstItem();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _resetFirstItem() {
    setState(() {
      itemCounts[0] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
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
