class BrandModel {
  int? tblMakeListID;
  String? tblMakeName;
  String? tblMakeMainCode;
  String? tblMajorCode;

  BrandModel({
    this.tblMakeListID,
    this.tblMakeName,
    this.tblMakeMainCode,
    this.tblMajorCode,
  });

  BrandModel.fromJson(Map<String, dynamic> json) {
    tblMakeListID = json['TblMakeListID'];
    tblMakeName = json['TblMakeName'];
    tblMakeMainCode = json['TblMakeMainCode'];
    tblMajorCode = json['tblMajorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TblMakeListID'] = this.tblMakeListID;
    data['TblMakeName'] = this.tblMakeName;
    data['TblMakeMainCode'] = this.tblMakeMainCode;
    data['tblMajorCode'] = this.tblMajorCode;
    return data;
  }
}
