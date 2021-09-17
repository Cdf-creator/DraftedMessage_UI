import 'package:drafts/app/data.dart';
import 'package:drafts/app/drafted_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                centerTitle: false,
                title: Text(
                  'Draft',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: ListView.builder(
                  //physics: BouncingScrollPhysics(),
                  itemCount: draftedList.length,
                  itemBuilder: (context, index) {
                    return DraftedItemWidget(
                      username: draftedList[index].username,
                      time: draftedList[index].time,
                      message: draftedList[index].message,
                    );
                  }),
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.open_in_new_outlined,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xff00B87C),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
