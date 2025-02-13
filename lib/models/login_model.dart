class LoginModel {
  bool? success;
  List<User>? user;
  String? token;

  LoginModel({
    this.success,
    this.user,
    this.token,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  num? tblUsersID;
  String? loginname;
  String? loginpass;
  String? loginfullname;
  String? branchcode;
  num? adminaccess;
  num? tRXNewAssets;
  num? tRXExistingAssets;
  num? tRXInventory;
  num? tRXassetMovementInternalTransfer;
  num? tRXAssetMovementforRepair;
  num? tRXAssetMovementforDisposed;
  num? tRXAssetMovementforReturns;
  num? tRXAssetTagGenerateEnable;
  num? tRXAssetTagPrintingAllow;
  num? tRXAllowImportExternalFile;
  String? email;
  String? phoneNumber;

  User(
      {this.tblUsersID,
      this.loginname,
      this.loginpass,
      this.loginfullname,
      this.branchcode,
      this.adminaccess,
      this.tRXNewAssets,
      this.tRXExistingAssets,
      this.tRXInventory,
      this.tRXassetMovementInternalTransfer,
      this.tRXAssetMovementforRepair,
      this.tRXAssetMovementforDisposed,
      this.tRXAssetMovementforReturns,
      this.tRXAssetTagGenerateEnable,
      this.tRXAssetTagPrintingAllow,
      this.tRXAllowImportExternalFile,
      this.email,
      this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    tblUsersID = json['TblUsersID'];
    loginname = json['loginname'];
    loginpass = json['loginpass'];
    loginfullname = json['loginfullname'];
    branchcode = json['branchcode'];
    adminaccess = json['adminaccess'];
    tRXNewAssets = json['TRXNewAssets'];
    tRXExistingAssets = json['TRXExistingAssets'];
    tRXInventory = json['TRXInventory'];
    tRXassetMovementInternalTransfer = json['TRXassetMovementInternalTransfer'];
    tRXAssetMovementforRepair = json['TRXAssetMovementforRepair'];
    tRXAssetMovementforDisposed = json['TRXAssetMovementforDisposed'];
    tRXAssetMovementforReturns = json['TRXAssetMovementforReturns'];
    tRXAssetTagGenerateEnable = json['TRXAssetTagGenerateEnable'];
    tRXAssetTagPrintingAllow = json['TRXAssetTagPrintingAllow'];
    tRXAllowImportExternalFile = json['TRXAllowImportExternalFile'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TblUsersID'] = this.tblUsersID;
    data['loginname'] = this.loginname;
    data['loginpass'] = this.loginpass;
    data['loginfullname'] = this.loginfullname;
    data['branchcode'] = this.branchcode;
    data['adminaccess'] = this.adminaccess;
    data['TRXNewAssets'] = this.tRXNewAssets;
    data['TRXExistingAssets'] = this.tRXExistingAssets;
    data['TRXInventory'] = this.tRXInventory;
    data['TRXassetMovementInternalTransfer'] =
        this.tRXassetMovementInternalTransfer;
    data['TRXAssetMovementforRepair'] = this.tRXAssetMovementforRepair;
    data['TRXAssetMovementforDisposed'] = this.tRXAssetMovementforDisposed;
    data['TRXAssetMovementforReturns'] = this.tRXAssetMovementforReturns;
    data['TRXAssetTagGenerateEnable'] = this.tRXAssetTagGenerateEnable;
    data['TRXAssetTagPrintingAllow'] = this.tRXAssetTagPrintingAllow;
    data['TRXAllowImportExternalFile'] = this.tRXAllowImportExternalFile;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
