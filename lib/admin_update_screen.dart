import 'package:firebase_flutter_pra/screen/model/peoduct_model.dart';
import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUpdateScreen extends StatefulWidget {
  const AdminUpdateScreen({Key? key}) : super(key: key);

  @override
  State<AdminUpdateScreen> createState() => _AdminUpdateScreenState();
}

class _AdminUpdateScreenState extends State<AdminUpdateScreen> {


  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtcat = TextEditingController();
  TextEditingController txtdec = TextEditingController();
  TextEditingController txtimage = TextEditingController();
  String? id;

  @override
  void initState() {
    super.initState();
    ProductModel model = Get.arguments;
    String id = model.id!;


    txtname = TextEditingController(text: model.name);
    txtprice = TextEditingController(text: model.price);
    txtcat = TextEditingController(text: model.cate);
    txtdec = TextEditingController(text: model.dec);
    txtimage = TextEditingController(text: model.img);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Update"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(
                  controller: txtname,
                  Name: "Product name",
                  TextInputType: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              buildTextField(
                  controller: txtprice,
                  Name: "Product Price",
                  TextInputType: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              buildTextField(
                  controller: txtcat,
                  Name: "Product Category",
                  TextInputType: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              buildTextField(
                  controller: txtdec,
                  Name: "Product description",
                  TextInputType: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              buildTextField(
                  controller: txtimage,
                  Name: "Product Image",
                  TextInputType: TextInputType.text),
              SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () {
                  ProductModel model = ProductModel(name: txtname.text,
                      img: txtimage.text,
                      price: txtprice.text,
                      cate: txtcat.text,
                      dec: txtdec.text,
                      id: id);
                  FireBaseHelper.base.updateProductData(model);
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text("Update", style: TextStyle(color: Colors
                          .white),)),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }

  Widget buildTextField(
      {required Name, required controller, required TextInputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$Name"),
        SizedBox(height: 3,),
        TextField(
          controller: controller,
          keyboardType: TextInputType,

          decoration: InputDecoration(
              border: OutlineInputBorder(),
              // label: Text("Product ${Name}",style: TextStyle(color: Colors.grey),),
              hintText: "$Name",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54))),
        ),
      ],
    );
  }
}
