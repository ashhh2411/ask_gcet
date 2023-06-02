// class PraysTimesModel{
//   int code;
//   String status;
//   PraysDataModel  data;
//   PraysTimesModel.fromJson(Map<String , dynamic> json){
//     code = json['code'];
//     status = json['status'];
//     data= PraysDataModel.fromJson(json['data']);
//   }
// }
//
// class PraysDataModel{
//   List<TimingsModel> timings =[];
//   PraysDataModel.fromJson(Map<String , dynamic> json){
//     json['timings'].forEach((element){
//       timings.add(TimingsModel.fromJson(json['timings']));
//     });
//     timings = json['timings'];
//
//   }
// }
//
// class TimingsModel{
//   String fajr;
//   String dhuhr;
//   String asr;
//   String maghrib;
//   String isha;
//   TimingsModel.fromJson(Map<String , dynamic> json){
//     fajr = json['Fajr'];
//     dhuhr = json['Dhuhr'];
//     asr= json['Asr'];
//     maghrib= json['Maghrib'];
//     isha= json['Isha'];
//   }
//
// }