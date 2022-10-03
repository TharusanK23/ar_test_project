class AspectRationService {
  static double getHeight(double height, double screenHeight) {
    return screenHeight * (height / 640);
  }

  static double getWidth(double width, double screenWidth) {
    return screenWidth * (width / 360);
  }
}
