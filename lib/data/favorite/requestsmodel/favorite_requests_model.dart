// {
//    "image_id":"abys",
//    "sub_id": "my-user-1234"
// }

class FavoriteRequestsModel {
  String imagedId;
  String subId;

  FavoriteRequestsModel({required this.imageId, required this.subId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['sub_id'] = this.subId;
    return data;
  }
}
