import 'package:arties_flutter_prototype/scoped_model/models/general/general_data_model.dart';
import 'package:arties_flutter_prototype/views/home/model/profile_section_model.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'create_artist_profile.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileSectionModel>(
      onModelReady: (model) => model.fetchProfileData(),
      builder: (context, child, model) => Container(
        child: model.isBusy ? Center(child: CircularProgressIndicator()) : buildContent(model)
      ),
    );
  }

  Widget buildContent(ProfileSectionModel model) {
    return ScopedModelDescendant<GeneralDataModel>(
      builder: (context, child, generalModel) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2000),
                        child: Container(
                          height: 75,
                          child: Image(
                            image: AssetImage("assets/img/no-user-photo.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(generalModel.loggedUser?.username, style: TextStyle(fontSize: 20)),
                          Text(generalModel.loggedUser?.fullName),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: model.isArtist ? Container() : CreateArtistProfile()
              ),
            ],
          ),
        ),
      ),
    );
  }
}