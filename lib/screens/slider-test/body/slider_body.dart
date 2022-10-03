part of sliderview;

class _SliderViewBody extends ViewModelWidget<SliderViewModel> {
  const _SliderViewBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, SliderViewModel model) {
    return Stack(
      children: [
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 250),
                  painter: MyPainter(),
                  // child: Row(
                  //   children: [
                  //     Icon(Icons.circle),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width * 0.9,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: ListWheelScrollView(
                    physics: const BouncingScrollPhysics(),
                    offAxisFraction: 4,
                    onSelectedItemChanged: (int i) => model.onItemChanged(i),
                    controller: model.scrollController,
                    diameterRatio: 10,
                    itemExtent: 150,
                    children: List.generate(
                      10,
                      (x) => AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: AnimatedOpacity(
                            opacity: x == model.selected ? 1.0 : 0.4,
                            duration: const Duration(milliseconds: 400),
                            child: Image.network(
                              'https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/12/kitten-google-3d.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

