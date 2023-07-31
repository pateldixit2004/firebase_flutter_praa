import 'package:firebase_flutter_pra/screen/model/peoduct_model.dart';
import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:firebase_flutter_pra/utils/local_notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProuctScreen extends StatefulWidget {
  const AddProuctScreen({Key? key}) : super(key: key);

  @override
  State<AddProuctScreen> createState() => _AddProuctScreenState();
}

class _AddProuctScreenState extends State<AddProuctScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtcat = TextEditingController();
  TextEditingController txtdec = TextEditingController();
  TextEditingController txtimage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            buildTextField(
                controller: txtname,
                Name: "Product name",
                TextInputType: TextInputType.text),
            SizedBox(
              height: 18,
            ),
            buildTextField(
                controller: txtprice,
                Name: "Product Price",
                TextInputType: TextInputType.number),
            SizedBox(
              height: 18,
            ),
            buildTextField(
                controller: txtcat,
                Name: "Product Category",
                TextInputType: TextInputType.text),
            SizedBox(
              height: 18,
            ),
            buildTextField(
                controller: txtdec,
                Name: "Product description",
                TextInputType: TextInputType.text),
            SizedBox(
              height: 18,
            ),
            Text("Product Image"),
            SizedBox(height: 8,),
            TextField(
                controller: txtimage,
              keyboardType: TextInputType.text,

              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // label: Text("Product ${Name}",style: TextStyle(color: Colors.grey),),
                  hintText: "Product Image",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54))
              ),),
            SizedBox(
              height: 20,
            ),

            Center(
              child: InkWell(
                onTap: () {

                  ProductModel model=ProductModel(name: txtname.text,img: txtimage.text,price: txtprice.text,cate: txtcat.text,dec: txtdec.text);

                      FireBaseHelper.base.insertproductDeta(model);
                  Notifactionhelper.notification.showSimpleNotifiction();

                  // if(txtname.text.isEmpty && txtimage.text.isEmpty && txtdec.text.isEmpty && txtcat.text.isEmpty && txtprice.text.isEmpty)
                    //   {
                    //     FireBaseHelper.base.insertproductDeta(model);
                    //   }
                    // else
                    //   {
                    //     Get.snackbar("Add the Data", "");
                    //   }

                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                  borderRadius: BorderRadius.circular(50),


                  ),
                  child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
