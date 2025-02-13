class GetAllCategoriesModel {
  int? tblMAINSUBSeriesNoID;
  String? mainCategoryCode;
  String? subCategoryCode;
  String? mainSubSeriesNo;
  String? mainDescription;
  String? subDescription;
  String? seriesNumber;

  GetAllCategoriesModel({
    this.tblMAINSUBSeriesNoID,
    this.mainCategoryCode,
    this.subCategoryCode,
    this.mainSubSeriesNo,
    this.mainDescription,
    this.subDescription,
    this.seriesNumber,
  });

  GetAllCategoriesModel.fromJson(Map<String, dynamic> json) {
    tblMAINSUBSeriesNoID = json['TblMAINSUBSeriesNoID'];
    mainCategoryCode = json['MainCategoryCode'];
    subCategoryCode = json['SubCategoryCode'];
    mainSubSeriesNo = json['MainSubSeriesNo'];
    mainDescription = json['MainDescription'];
    subDescription = json['SubDescription'];
    seriesNumber = json['SeriesNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TblMAINSUBSeriesNoID'] = this.tblMAINSUBSeriesNoID;
    data['MainCategoryCode'] = this.mainCategoryCode;
    data['SubCategoryCode'] = this.subCategoryCode;
    data['MainSubSeriesNo'] = this.mainSubSeriesNo;
    data['MainDescription'] = this.mainDescription;
    data['SubDescription'] = this.subDescription;
    data['SeriesNumber'] = this.seriesNumber;
    return data;
  }
}
