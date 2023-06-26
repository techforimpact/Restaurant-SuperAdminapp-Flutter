// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

import 'package:get/get.dart';
import '../../controllers/general_controller.dart';
import '../../models/review.dart';
import '../../utils/global.dart';

class ReviewTable extends StatefulWidget {
  const ReviewTable({Key? key,}) : super(key: key);

  @override
  State<ReviewTable> createState() => _ReviewTableState();
}

class _ReviewTableState extends State<ReviewTable> {
  final List<String> _banner = [
    'Customer Name',
    'Average ratting',
    'Reveiw Time ',
    'Food items you collected ?',
       'Customer Service of the restaurent? ',
    'Overall experience with restaurent?',
    'Review',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            height: 20,
          ),
          // table header
          Container(
            color: Global.deepOrange,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    _banner.length,
                    (index) => Expanded(
                      child: FlatButton(
                        color: Global.deepOrange,
                        onPressed: () {},
                        child: Padding(
                          padding:  EdgeInsets.all(Constants.kPadding * 2),
                          child: Text(
                            _banner[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                  //
                  ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
              FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection('restaurants').doc( Get.find<GeneralController>()
              .boxStorage.read('uid')).collection('review_ratting').get(),
            builder: (BuildContext context, snapshot) {
              
              if (snapshot.hasData) {
                var _status = <Review>[];
                var data = snapshot.data!.docs;
                for (var element in data) {
                  _status.add(Review.fromMap(element.data()));
                }
                print('data list ============> $data');

                if (_status.isNotEmpty) {
                    return Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Container(
                        height: MediaQuery.of(context).size.height*0.80 ,
                        padding: const EdgeInsets.only(left: 20, right: 40),
                        child: ListView.builder(
                            itemCount: _status.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(_status[index].userName)),
                                    Expanded(child: Text(_status[index].avgRatings.toString())),
                                    Expanded(child: Text(_status[index].dateTime.toString().substring(0,16))),
                                    Expanded(child: Text(_status[index].ratingValue1.toString())),
                                    Expanded(child: Text(_status[index].ratingValue2.toString())),
                                    Expanded(child: Text(_status[index].ratingValue3.toString())),
                                    Expanded(child: Text(_status[index].reviews)),
                                  ],
                                ),
                              );
                            })));
              
                }else{
                  return Center(
                    child: Text('NO RECORD FOUND',style: TextStyle(fontSize: 24),),
                  );
                }
              
              
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
      
      ],
    );
  }
}