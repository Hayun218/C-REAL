

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraExample extends StatefulWidget {
  const CameraExample({Key? key}) : super(key: key);

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return
Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            showImage(),
            SizedBox(
              height: 50.0,
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

                // 갤러리에서 이미지를 가져오는 버튼
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