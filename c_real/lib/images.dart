

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final picker = ImagePicker();


  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
  }

  Widget showImage() {
    return DottedBorder(
      child: Container(
          color: const Color(0xffd0cece),
          width: 400,
          height: 300,
          child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(File(_image!.path)))),
    );
  }

  Future<String> _submit() async {
    final storageRef = FirebaseStorage.instance.ref();

    final mountainsRef = storageRef.child(_image!.path);
    await mountainsRef.putFile(File(_image!.path));
    String url = await mountainsRef.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {

    return
Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            showImage(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // 카메라 촬영 버튼

                FloatingActionButton(
                  child: Icon(Icons.add_a_photo),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),


                FloatingActionButton(
                  child: Icon(Icons.wallpaper),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            )
          ],
        );
    if(_image != null){
      String imgURL = _submit() as String;
      print(imgURL);
    }
  }
}


// class ImageUploader extends StatefulWidget {
//   const ImageUploader({Key? key}) : super(key: key);
//
//   @override
//   _ImageUploaderState createState() => _ImageUploaderState();
// }
//
// class _ImageUploaderState extends State<ImageUploader> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   final ImagePicker _picker = ImagePicker();
//   List<XFile> _pickedImgs = [];
//
//   Future<void> _pickImg() async {
//     final List<XFile>? images = await _picker.pickMultiImage();
//     if (images != null) {
//       setState(() {
//         _pickedImgs = images;
//       });
//     }
//   }
//
//   uploadImage() async {
//     print(_pickedImgs.toString());
//     var dio = Dio();
//     try {
//       List<MultipartFile> multipartImgList = [];
//
//       for (int i = 0; i < _pickedImgs.length; i++) {
//         var pic = await MultipartFile.fromFile(_pickedImgs[i].path,
//             contentType: new MediaType("image", "jpg"));
//         multipartImgList.add(pic);
//       }
//
//       FormData formData = new FormData.fromMap({
//         "images": multipartImgList,
//       });
//
//
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isPadMode = MediaQuery.of(context).size.width > 700;
//
//     List<Widget> _boxContents = [
//       IconButton(
//           onPressed: () {
//             _pickImg();
//           },
//           icon: Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
//               child: Icon(
//                 Icons.camera,
//                 color: Theme.of(context).colorScheme.primary,
//               ))),
//       Container(),
//       Container(),
//       _pickedImgs.length <= 4
//           ? Container()
//           : FittedBox(
//           child: Container(
//               padding: EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.6),
//                   shape: BoxShape.circle),
//               child: Text(
//                 '+${(_pickedImgs.length - 4).toString()}',
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2
//                     ?.copyWith(fontWeight: FontWeight.w800),
//               ))),
//     ];
//
//     return GridView.count(
//       shrinkWrap: true,
//       padding: EdgeInsets.all(2),
//       crossAxisCount: isPadMode ? 4 : 2,
//       mainAxisSpacing: 5,
//       crossAxisSpacing: 5,
//       children: List.generate(
//           4,
//               (index) => DottedBorder(
//               child: Container(
//                 child: Center(child: _boxContents[index]),
//                 decoration: index <= _pickedImgs.length - 1
//                     ? BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: FileImage(i.File(_pickedImgs[index].path))))
//                     : null,
//               ),
//               color: Colors.grey,
//               dashPattern: [5, 3],
//               borderType: BorderType.RRect,
//               radius: Radius.circular(10))).toList(),
//     );
//   }
//}