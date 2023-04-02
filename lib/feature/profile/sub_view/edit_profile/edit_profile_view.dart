import 'package:firebase_news_full_app/enums/image_constants.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Form(
        child: Padding(
          padding: context.paddingNormal,
          child: ListView(
            children: [
              const EditPhoto(),
              const _TextFieldColumn(
                name: StringConstants.editUsername,
              ),
              _low3xEmptySizedBox(context),
              const _TextFieldColumn(
                name: StringConstants.editFullname,
              ),
              _low3xEmptySizedBox(context),
              const _TextFieldColumn(
                name: StringConstants.editEmailAddress,
              ),
              _low3xEmptySizedBox(context),
              const _TextFieldColumn(
                name: StringConstants.editPhone,
              ),
              _low3xEmptySizedBox(context),
              const _TextFieldColumn(
                name: StringConstants.editBio,
              ),
              _low3xEmptySizedBox(context),
            ],
          ),
        ),
      ),
    );
  }
}

class EditPhoto extends StatelessWidget {
  const EditPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: const [
          CircleProfileImage(),
          EditPhotoButton(),
        ],
      ),
    );
  }
}

class EditPhotoButton extends StatelessWidget {
  const EditPhotoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorConst.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: IconButton(
            color: ColorConst.white,
            onPressed: () {},
            icon: const Icon(Icons.photo_camera_outlined),
          ),
        ),
      ),
    );
  }
}

class CircleProfileImage extends StatelessWidget {
  const CircleProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          ImageConstants.avatarPhoto.toJpg,
          height: 140,
          width: 140,
        ),
      ),
    );
  }
}

class _TextFieldColumn extends StatelessWidget {
  const _TextFieldColumn({
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        _lowEmptySizedBox(context),
        TextFormField(),
      ],
    );
  }
}

SizedBox _lowEmptySizedBox(BuildContext context) =>
    SizedBox(child: context.emptySizedHeightBoxLow);

SizedBox _low3xEmptySizedBox(BuildContext context) =>
    SizedBox(child: context.emptySizedHeightBoxLow3x);
