class Usercreation{
  String? mobileNumber;
  String? name;
  String? email;
  String? branch;
  String? location;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? country;
  String? sDate;
  String? eDate;
  String? paymentMode;
  String? amountPaid;
  String? createdBy;
  int? isBreakfast;
  int? isDinner;
  int? isLunch;

  Usercreation({
    required this.mobileNumber,
    required this.name,
    required this.email,
    required this.branch,
    required this.location,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.sDate,
    required this.eDate,
    required this.paymentMode,
    required this.amountPaid,
    required this.createdBy,
    required this.isBreakfast,
    required this.isDinner,
    required this.isLunch,

    required context,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
      'name':name,
      'email':email,
      'branch':branch,
      'location':location,
      'address':address,
      'city':city,
      'state':state,
      'pincode':pincode,
      'country':country,
      'sDate':sDate,
      'eDate':eDate,
      'paymentMode':paymentMode,
      'amountPaid':amountPaid,
      'createdBy':createdBy,
      'isBreakfast':isBreakfast,
      'isDinner':isDinner,
      'isLunch':isLunch,
    };
  }

}