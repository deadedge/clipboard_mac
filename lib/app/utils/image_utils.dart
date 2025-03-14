class ImageUtils {
  static bool isImage(String imagePath) {
    List<String> imageExtensions = ["jpeg", "jpg", "gif", "png", "webp"];

    for (var extension in imageExtensions) {
      if (imagePath.split(".").last == extension) return true;
    }
    return false;
  }
}
