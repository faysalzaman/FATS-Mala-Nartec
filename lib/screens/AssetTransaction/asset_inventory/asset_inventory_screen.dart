// import 'dart:io';

import 'package:mala_fats/Services/AssetVarification/AsseetConditionServices.dart';
import 'package:mala_fats/Services/AssetVarification/BoughtServices.dart';
import 'package:mala_fats/Services/AssetVarification/EmployeeNameIdServices.dart';
import 'package:mala_fats/Services/AssetVarification/SaveTag.dart';
import 'package:mala_fats/constants.dart';
import 'package:mala_fats/screens/AssetTransaction/asset_inventory/scanned_asset_screen.dart';
import 'package:mala_fats/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AssetsInventoryScreen extends StatefulWidget {
  const AssetsInventoryScreen({super.key});

  @override
  State<AssetsInventoryScreen> createState() => _AssetsInventoryScreenState();
}

class _AssetsInventoryScreenState extends State<AssetsInventoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _locationTagController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _nameInfoController = TextEditingController();
  final TextEditingController _assetLocationDetailsController =
      TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _phoneExtensionController =
      TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _otherTagController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  String? selectInventoryJournal;
  var inventoryJournalList = [];

  String? selectEmployeeName;
  var employeeNameList = [];

  String? selectAssetCondition;
  var assetConditionList = [];

  String? selectBought;
  var boughtList = [];

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  var employeeIdList = [];

  @override
  void initState() {
    super.initState();
    EmployeeNameIdServices.nameIDMethod().then((employees) {
      setState(() {
        selectEmployeeName = employees[0].empName.toString();
        for (var employee in employees) {
          employeeNameList.add(employee.empName.toString());
          employeeIdList.add(employee.empID.toString());
        }
      });
    });

    AssetConditionServices.assetCondition().then((assetCondition) {
      setState(() {
        selectAssetCondition =
            assetCondition[0].tblConditionDescription.toString();
        for (var asset in assetCondition) {
          assetConditionList.add(asset.tblConditionDescription.toString());
        }
      });
    });

    BoughtServices.assetCondition().then((value) {
      setState(() {
        selectBought = value[0].tblConditionDescriptionBought.toString();
        for (var bought in value) {
          boughtList.add(bought.tblConditionDescriptionBought.toString());
        }

        isLoading = false;
      });
    });
  }

  bool isLoading = true;

  int tblAssetMasterEncodeAssetCaptureID = 0;
  String majorCategory = "";
  String majorCategoryDescription = "";
  String minorCategory = "";
  String minorCategoryDescription = "";
  String tagNumber = "";
  String serialNumber = '';
  String assetDescription = "";
  String assetType = '';
  String assetCondition = '';
  String country = "";
  String region = "";
  String cityName = "";
  String dao = "";
  String daoName = '';
  String businessUnit = "";
  String buildingNo = "";
  String floorNo = "";
  String employeeID = '';
  String ponNumber = '';
  String poDate = '';
  String deliveryNoteNo = '';
  String supplier = '';
  String invoiceNo = '';
  String invoiceDate = '';
  String modelOfAsset = "";
  String manufacturer = "";
  String ownership = '';
  String bought = '';
  String terminalID = '';
  String atmNumber = '';
  String locationTag = '';
  String buildingName = "";
  String buildingAddress = "";
  String userLoginID = "";
  int mainSubSeriesNo = 0;
  String assetDateCaptured = '';
  String assetTimeCaptured = '';
  String assetDateScanned = '';
  String assetTimeScanned = '';
  int qty = 0;
  String phoneExtNo = '';
  String fullLocationDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading icon color white
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constant.primaryColor,
        title: const Text(
          'Assets Inventory',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Select Inventory Journal",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                value: selectInventoryJournal,
                                isExpanded: true,
                                items: inventoryJournalList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectInventoryJournal = value.toString();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    // rgba(128, 118, 3, 1)
                                    backgroundColor:
                                        Color.fromARGB(255, 128, 118, 3)),
                                onPressed: () {
                                  Get.to(() => ScannedAssetsScreen());
                                },
                                child: Text("View Scanned Assets"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Enter / Scan TAG Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormFieldWidget(
                              suffix: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.qr_code,
                                  color: Constant.primaryColor,
                                ),
                              ),
                              color: Color.fromARGB(48, 45, 219, 146),
                              controller: _nameInfoController,
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(48, 45, 219, 146),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: _assetLocationDetailsController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Asset Location Details",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(48, 45, 219, 146),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: _assetLocationDetailsController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Enter/Scan Serial Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormFieldWidget(
                              suffix: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.qr_code,
                                  color: Constant.primaryColor,
                                ),
                              ),
                              controller: _serialNoController,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Employee Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Employee Name",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                value: selectEmployeeName,
                                isExpanded: true,
                                items: employeeNameList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectEmployeeName = value.toString();
                                    _employeeIdController.text = employeeIdList[
                                        employeeNameList.indexOf(value)];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        // Employee Id
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "Employee Id",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Constant.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                TextFormFieldWidget(
                                  readOnly: true,
                                  controller: _employeeIdController,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "Ext. Number",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Constant.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                TextFormFieldWidget(
                                  controller: _phoneExtensionController,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        // Room
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Room",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Constant.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: TextFormFieldWidget(
                                  controller: _roomController,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        // // other tag
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       child: Text(
                        //         "Other Tag",
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: Constant.primaryColor,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 10),
                        //     TextFormFieldWidget(
                        //       controller: _otherTagController,
                        //       height: 50,
                        //       width: MediaQuery.of(context).size.width * 0.9,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // // notes
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       child: Text(
                        //         "Notes",
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: Constant.primaryColor,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 5),
                        //     SizedBox(
                        //       width: MediaQuery.of(context).size.width * 0.9,
                        //       child: TextFormField(
                        //         controller: _notesController,
                        //         maxLines: 3,
                        //         decoration: InputDecoration(
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(20),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () async {
                        //         try {
                        //           final imgpicker = ImagePicker();

                        //           var pickedfile = await imgpicker.pickImage(
                        //               source: ImageSource.camera);
                        //           //you can use ImageCourse.camera for Camera capture

                        //           if (pickedfile != null) {
                        //             if (imagefiles != null) {
                        //               imagefiles!.add(pickedfile);
                        //             } else {
                        //               imagefiles = [pickedfile];
                        //             }
                        //             setState(() {});
                        //           } else {
                        //             print("No image is selected.");
                        //           }
                        //         } catch (e) {
                        //           print("error while picking file.");
                        //         }
                        //       },
                        //       icon: const Icon(
                        //         Icons.add_a_photo,
                        //         size: 50,
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //     SizedBox(width: 20),
                        //     IconButton(
                        //       onPressed: () async {
                        //         try {
                        //           final imgpicker = ImagePicker();

                        //           var pickedfiles =
                        //               await imgpicker.pickMultiImage();
                        //           //you can use ImageCourse.camera for Camera capture

                        //           if (pickedfiles.isNotEmpty &&
                        //               pickedfiles.length <= 4) {
                        //             if (imagefiles != null) {
                        //               for (var i = 0;
                        //                   i < imagefiles!.length;
                        //                   i++) {
                        //                 pickedfiles.add(imagefiles![i]);
                        //               }
                        //             }
                        //             imagefiles = pickedfiles;

                        //             setState(() {});
                        //           } else {
                        //             print("No image is selected.");
                        //           }
                        //         } catch (e) {
                        //           print("error while picking file.");
                        //         }
                        //       },
                        //       icon: const Icon(
                        //         Icons.add_photo_alternate,
                        //         size: 50,
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // const Text(
                        //   "Add upto 4 images",
                        //   style: TextStyle(
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.red,
                        //   ),
                        // ),

                        // SizedBox(height: 20),
                        // imagefiles != null
                        //     ? Wrap(
                        //         children: imagefiles!.map((imageone) {
                        //           return Stack(
                        //             children: [
                        //               Card(
                        //                 shadowColor: Constant.primaryColor,
                        //                 elevation: 10,
                        //                 margin: const EdgeInsets.symmetric(
                        //                     vertical: 10, horizontal: 5),
                        //                 child: SizedBox(
                        //                   height: 70,
                        //                   width: 60,
                        //                   child: Image.file(
                        //                     File(imageone.path),
                        //                     fit: BoxFit.cover,
                        //                   ),
                        //                 ),
                        //               ),
                        //               Positioned(
                        //                 top: 0,
                        //                 right: 0,
                        //                 child: IconButton(
                        //                   onPressed: () {
                        //                     imagefiles!.remove(imageone);
                        //                     setState(() {});
                        //                   },
                        //                   icon: Icon(
                        //                     Icons.cancel,
                        //                     color: Colors.red.withOpacity(0.8),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         }).toList(),
                        //       )
                        //     : Container(),
                        // SizedBox(height: 20),
                        // // asset condition
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Asset Condition",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                value: selectAssetCondition,
                                isExpanded: true,
                                items: assetConditionList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectAssetCondition = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        // bought
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "Asset Bought Status",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                value: selectBought,
                                isExpanded: true,
                                items: boughtList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectBought = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Constant.primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              Constant.showLoadingDialog(context);
                              if (_tagController.text.trim().isEmpty ||
                                  _serialNoController.text.trim().isEmpty ||
                                  _employeeIdController.text.trim().isEmpty ||
                                  _notesController.text.trim().isEmpty ||
                                  _otherTagController.text.trim().isEmpty ||
                                  _locationTagController.text.trim().isEmpty) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please fill all the fields"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                SaveTagServices.saveTag(
                                  context,
                                  tblAssetMasterEncodeAssetCaptureID,
                                  majorCategory,
                                  majorCategoryDescription,
                                  minorCategory,
                                  minorCategoryDescription,
                                  _tagController.text.trim(),
                                  _serialNoController.text.trim(),
                                  assetDescription,
                                  assetType,
                                  selectAssetCondition.toString(),
                                  country,
                                  region,
                                  cityName,
                                  dao,
                                  daoName,
                                  businessUnit,
                                  buildingNo,
                                  floorNo,
                                  _employeeIdController.text.trim(),
                                  ponNumber,
                                  poDate,
                                  _notesController.text.trim(),
                                  supplier,
                                  invoiceNo,
                                  invoiceDate,
                                  modelOfAsset,
                                  manufacturer,
                                  ownership,
                                  selectBought.toString(),
                                  terminalID,
                                  _otherTagController.text.trim(),
                                  _locationTagController.text.trim(),
                                  buildingName,
                                  buildingAddress,
                                  mainSubSeriesNo,
                                  assetDateCaptured,
                                  assetTimeCaptured,
                                  assetDateScanned,
                                  assetTimeScanned,
                                  qty,
                                  _phoneExtensionController.text.trim(),
                                  _assetLocationDetailsController.text.trim(),
                                  imagefiles!,
                                ).then((value) {});
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _locationTagController.dispose();
    _tagController.dispose();
    _assetLocationDetailsController.dispose();
    _serialNoController.dispose();
    _phoneExtensionController.dispose();
    _employeeIdController.dispose();
    _otherTagController.dispose();
    _notesController.dispose();
    _roomController.dispose();
    _nameInfoController.dispose();

    employeeNameList.clear();

    assetConditionList.clear();
    selectAssetCondition = "Select Asset Condition";
    assetConditionList.insert(0, "Select Asset Condition");

    boughtList.clear();
    selectBought = "Select Asset Bought";
    boughtList.insert(0, "Select Asset Bought");

    imagefiles?.clear();
  }
}
