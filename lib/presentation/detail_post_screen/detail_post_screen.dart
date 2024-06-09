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
    setState(() {});
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
                child: Column(
                  children: [
                    Container(
                      width: 0.2.sw,
                      height: 0.007.sh,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 0.06.sh,
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        widget.post.userProfilePic,
                                        height: 0.06.sh,
                                        width: 0.06.sh,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 0.05.sw),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 0.02.sh,
                                          child: Text(
                                            ' ${widget.post.userName}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.04.sh,
                                          child: Text(
                                            widget.post.title,
                                            style: TextStyle(fontSize: 22.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite_border),
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        const Icon(Icons.comment),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
