class FriendModel {
  String name;
  String friendId;
  String imageUrl;

  FriendModel({
    this.name = '',
    this.friendId = '',
    this.imageUrl = '',
  });

  // Factory method to create a FriendModel from Firestore data
  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      name: json['name'] ?? '',
      friendId: json['friendId'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Method to convert FriendModel to Firestore-compatible map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'friendId': friendId,
      'imageUrl': imageUrl,
    };
  }
}
