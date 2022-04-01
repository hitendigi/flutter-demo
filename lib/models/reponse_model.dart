class ResponseModel {
  dynamic status;
  dynamic message;
  dynamic data;
  dynamic response;
  dynamic result;

  ResponseModel({this.status, this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "success";
    message = json['message'] ?? "Got Data";
    data = json['data'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['result'] = this.result;
    return data;
  }
}
