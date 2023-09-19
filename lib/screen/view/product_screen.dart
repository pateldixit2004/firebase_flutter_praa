import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_pra/screen/model/peoduct_model.dart';
import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireBaseHelper.base.readProductData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data!;
          List<QueryDocumentSnapshot> querysnapList = querySnapshot.docs;
          List<ProductModel> l1 = [];

          for (var x in querysnapList) {
            Map m1 = x.data() as Map;
            String id = x.id;
            String name = m1['name'];
            String cate = m1['cate'];
            String dec = m1['dec'];
            String img = m1['img'];
            String price = m1['price'];

            ProductModel model = ProductModel(
                name: name,
                dec: dec,
                cate: cate,
                price: price,
                img: img,
                id: id);

            l1.add(model);
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  margin: EdgeInsets.only(top: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.sp),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.9,
                          color: Colors.grey.shade100,
                          spreadRadius: 0.5
                      )

                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 2.w,),
                      l1[index].img!.isEmpty?Image.network(
                        "https://m.media-amazon.com/images/I/41ATdIgTJLL.jpg",
                        height: 10.h,
                      ):
                      Image.network(
                      "${l1[index].img}",
                          // l1[index].img==null?"https://m.media-amazon.com/images/I/41ATdIgTJLL.jpg":"${l1[index].img}",
                        height: 10.h,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${l1[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "₹ ${l1[index].price}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.orange),
                          ),
                          SizedBox(height: 5,),

                          Text(
                            "${l1[index].dec}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextButton(
                              onPressed: () {
                                Get.dialog(AlertDialog(
                                  title: Text("Are you sure when to delete"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Get.back();
                                    }, child: Text("Cancle",style: TextStyle(color: Colors.black54),)),

                                    TextButton(onPressed: (){
                                      String? id = l1[index].id;
                                      print(id);
                                      FireBaseHelper.base.deleteProduct(id!);
                                      Get.back();
                                    }, child: Text("Delete",style: TextStyle(color: Colors.redAccent),))
                                  ],
                                ));
                                // String? id = l1[index].id;
                                // print(id);
                                // FireBaseHelper.base.deleteProduct(id!);
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed("/update", arguments: l1[index]);
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:2.w,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: l1.length,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
