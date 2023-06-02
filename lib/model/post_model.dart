class PostModel{
  String? drName;
  String? uId;
  String? text;
  String? dateTime;

  PostModel({
    this.drName,
    this.uId,
    this.text,
    this.dateTime,

  });

  PostModel.fromJson(Map<String, dynamic>json){
    drName =json['drName'];
    uId =json['uId'];
    text =json['text'];
    dateTime =json['dateTime'];
  }
  Map<String, dynamic>toMap(){
    return{
      'drName': drName,
      'uId': uId,
      'text': text,
      'dateTime': dateTime,
    };
  }

}