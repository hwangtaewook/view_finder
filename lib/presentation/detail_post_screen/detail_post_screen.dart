import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/detail_post_screen/component/meta_data_item.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart';
import '../../domain/model/post.dart';

class DetailPostScreen extends StatefulWidget {
  final Post post;

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();

  const DetailPostScreen({
    super.key,
    required this.post,
  });
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
    double imageHeight = 0.8.sh;
    final viewModel = context.watch<DetailPostViewModel>();

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.06.sh,
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        widget.post.userProfilePic,
                                        height: 0.05.sh,
                                        width: 0.05.sh,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 0.05.sw),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 0.023.sh,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              ' ${widget.post.userNickName}',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.037.sh,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              widget.post.title,
                                              style: TextStyle(fontSize: 18.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.02.sw,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite_border),
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        const Icon(Icons.comment),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.02.sh,
                              ),
                              Text(
                                widget.post.content,
                                style: TextStyle(fontSize: 16.sp),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 0.02.sh),
                              MetaDataItem(
                                check: widget.post.metaData['Image Make'],
                                label: '제조사',
                                value: widget.post.metaData['Image Make'],
                              ),
                              MetaDataItem(
                                check: widget.post.metaData['Image Model'],
                                label: '카메라',
                                value: widget.post.metaData['Image Model'],
                              ),
                              MetaDataItem(
                                check: widget.post.metaData['EXIF LensModel'],
                                label: '렌즈   ',
                                value: widget.post.metaData['EXIF LensModel'],
                              ),
                              MetaDataItem(
                                check: widget.post.metaData['Image DateTime'],
                                label: '날짜   ',
                                value: widget.post.metaData['Image DateTime'],
                              ),
                              MetaDataItem(
                                check:
                                    widget.post.metaData['EXIF ExposureTime'],
                                label: '셔터    ',
                                value:
                                    widget.post.metaData['EXIF ExposureTime'],
                              ),
                              MetaDataItem(
                                check: widget.post.metaData['EXIF FNumber'],
                                label: '조리개',
                                value:
                                    'f ${viewModel.convert(widget.post.metaData['EXIF FNumber']).toString()}',
                              ),
                              MetaDataItem(
                                check: widget
                                    .post.metaData['EXIF ISOSpeedRatings'],
                                label: 'ISO',
                                value: widget
                                    .post.metaData['EXIF ISOSpeedRatings'],
                              ),
                              MetaDataItem(
                                check: widget.post.metaData['EXIF FocalLength'],
                                label: '초점    ',
                                value:
                                    '${widget.post.metaData['EXIF FocalLength']}mm',
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
