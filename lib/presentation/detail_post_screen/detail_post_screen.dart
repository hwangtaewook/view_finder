import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../domain/model/post.dart';

class DetailPostScreen extends StatefulWidget {
  final Post post;

  const DetailPostScreen({
    super.key,
    required this.post,
  });

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  bool isSheetAttached = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleDraggableSheetScroll);
    Future.microtask(() => setState(() {})); // Ensure initial state update
  }

  @override
  void dispose() {
    _controller.removeListener(_handleDraggableSheetScroll);
    _controller.dispose();
    super.dispose();
  }

  void _handleDraggableSheetScroll() {
    setState(() {
      // Listener to detect changes
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = 600; // Set this to your image height

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double minPosition = 1.sh * 0.52;
              double maxPosition = 0;
              double topPosition = minPosition -
                  (_controller.size * (minPosition - maxPosition)) -
                  (imageHeight / 2);

              return Positioned(
                top: topPosition,
                left: 0,
                right: 0,
                child: Hero(
                  tag: widget.post.postId,
                  child: Image.network(
                    widget.post.imageUrl,
                    height: imageHeight,
                  ),
                ),
              );
            },
          ),
          DraggableScrollableSheet(
            controller: _controller,
            snap: true,
            initialChildSize: 0.1,
            snapAnimationDuration: const Duration(microseconds: 10),
            minChildSize: 0.1,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              if (!isSheetAttached) {
                Future.microtask(() {
                  setState(() {
                    isSheetAttached = true; // Mark sheet as attached
                  });
                });
              }
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Bottom Sheet Item $index'),
                    );
                  },
                ),
              );
            },
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ],
      ),
    );
  }
}
