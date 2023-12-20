class QRupdate{
  String? qrId;
  String? branch;
  String? user;
  String? adminId;
  QRupdate({
    required this.qrId,
    required this.branch,
    required this.user,
    required this.adminId,
    required context,
  });

  Map<String, dynamic> toMap() {
    return {
      'qrId': qrId,
      'branch': branch,
      'user': user,
      'adminId': adminId,

    };
  }

}