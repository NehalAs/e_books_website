class RequestModel
{
  String? senderId;
  String? receiverId;
  String? dateTime;
  bool? isAccepted;
  String? senderMail;
  var requestId;



  RequestModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.isAccepted,
    this.senderMail,
    this.requestId,
  });

  RequestModel.fromJson(Map<String,dynamic>? json)
  {
    senderId= json!['senderId'];
    receiverId= json['receiverId'];
    dateTime= json['dateTime'];
    isAccepted= json['isAccepted'];
    senderMail= json['senderMail'];
    requestId= json['requestId'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'senderId':senderId,
      'receiverId': receiverId,
      'dateTime':dateTime,
      'isAccepted':isAccepted,
      'senderMail':senderMail,
      'requestId':requestId,
    };
  }
}