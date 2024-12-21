class VoteRequestsModel {
    final String imageId;
    final String subId;
    final int value;

    VoteRequestsModel({
        required this.imageId,
        required this.subId,
        required this.value,
    });
    Map<String, dynamic> toJson(){
        return {
            "image_id": imageId,
            "sub_id": subId,
            "value": value,
        };
    }
}