// lib/features/reels/data/models/reel_model.dart
class ReelModel {
  final String id;
  final String doctorName;
  final String title;
  final String thumbnailPath;
  final String videoPath; // or image path for this demo
  final String views;
  final String likes;

  ReelModel({
    required this.id,
    required this.doctorName,
    required this.title,
    required this.thumbnailPath,
    required this.videoPath,
    required this.views,
    required this.likes,
  });
}

// Dummy Data List
final List<ReelModel> dummyReels = [
  ReelModel(
    id: "1",
    doctorName: "Dr. Joynal Abedin",
    title: "5 Tips for a Healthy Heart",
    thumbnailPath: 'assets/reels/image1.png',
    videoPath: 'assets/reels/image1.png',
    views: "3.4k",
    likes: "1.2k",
  ),
  ReelModel(
    id: "2",
    doctorName: "Dr. Sarah",
    title: "Understanding Skin Care",
    thumbnailPath: 'assets/reels/image2.png',
    videoPath: 'assets/reels/image2.png',
    views: "5.1k",
    likes: "2.3k",
  ),
  ReelModel(
    id: "3",
    doctorName: "Dr. Chen",
    title: "Understanding Skin Care",
    thumbnailPath: 'assets/reels/image3.png',
    videoPath: 'assets/reels/image3.png',
    views: "5.1k",
    likes: "2.3k",
  ),
  ReelModel(
    id: "4",
    doctorName: "Dr. Saran",
    title: "Understanding Skin Care",
    thumbnailPath: 'assets/reels/image4.png',
    videoPath: 'assets/reels/image4.png',
    views: "5.1k",
    likes: "2.3k",
  ),
  ReelModel(
    id: "5",
    doctorName: "Dr. Sahen",
    title: "Understanding Skin Care",
    thumbnailPath: 'assets/reels/image5.png',
    videoPath: 'assets/reels/image5.png',
    views: "5.1k",
    likes: "2.3k",
  ),
  ReelModel(
    id: "6",
    doctorName: "Dr. Gahen",
    title: "Understanding Skin Care",
    thumbnailPath: 'assets/reels/image6.png',
    videoPath: 'assets/reels/image6.png',
    views: "5.1k",
    likes: "2.3k",
  ),
];