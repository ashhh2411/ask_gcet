class UserModel{
  String? name;
  String? email;
  String? year;
  String? status;
  String? academic;
  String? uId;

UserModel({
  this.name,
  this.email,
  this.year,
  this.status,
  this.academic,
  this.uId
});

UserModel.fromJson(Map<String, dynamic>?json){
name =json!['name'];
email =json['email'];
year =json['year'];
status =json['status'];
academic =json['academic'];
uId =json['uId'];
}
  Map<String, dynamic>toMap(){
  return{
    'name': name,
    'email': email,
    'year': year,
    'status': status,
    'uId': uId,
    'academic': academic,

  };
  }

}