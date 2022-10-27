import 'package:appdemo/Trangtinchi.dart';
import 'package:appdemo/hasting_widthget.dart';
import 'package:appdemo/slider_widget.dart';
import 'package:flutter/material.dart';

class DestinationPage extends StatelessWidget {
  DestinationPage({Key? key}) : super(key: key);
  String urlImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF1.jpg/800px-%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF1.jpg";
  String content =
      "Trường Đại học Khoa học là một trường đại học thuộc hệ thống Đại học Huế, được xếp vào nhóm đại học trọng điểm cấp quốc gia của Việt Nam. Trường có tiền thân là Trường Đại học Tổng hợp Huế, được thành lập trên cơ sở sáp nhập trường Đại học Khoa học và trường Đại học Văn khoa của Viện Đại học Huế được thành lập từ năm 1957.[1] Năm 1994, trường đại học Tổng hợp trở thành trường thành viên của Đại học Huế và được đổi tên thành trường Đại học Khoa học.[2]";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // cái cây
        body: SingleChildScrollView(
      child: Column(
        children: [
          TinChiPage(),
          // blockTitle(context)
          // Container(
          //   child: Image.asset("assets/images/a2.jpg"),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(40),
          //   child: Container(
          //       child: Column(
          //     children: [
          //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //         Column(
          //           children: [
          //             Icon(Icons.call),
          //             Row(
          //               children: [Text("Call")],
          //             )
          //           ],
          //         ),
          //         Column(
          //           children: [
          //             Icon(Icons.route),
          //             Row(
          //               children: [Text("Route")],
          //             )
          //           ],
          //         ),
          //         Column(
          //           children: [
          //             Icon(Icons.share),
          //             Row(
          //               children: [Text("Share")],
          //             )
          //           ],
          //         ),
          //       ]),
          //       Container(
          //         margin: EdgeInsets.only(top: 30),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               // ignore: prefer_const_literals_to_create_immutables
          //               children: [
          //                 Text(
          //                   "Gái xinh",
          //                   textAlign: TextAlign.left,
          //                 ),
          //                 Text("Môt cô gái có khuôn mặt xinh xắn")
          //               ],
          //             ),
          //             Row(
          //               children: [Icon(Icons.star), Text("41")],
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 30),
          //         child: Row(
          //           children: [
          //             Flexible(
          //                 child: Text(
          //                     "Những cô gái xinh là những người sở hữu các nét đẹp trên khuôn mặt, có thể là toàn bộ ngũ quan đều đẹp, cũng có thể chỉ vài nét trên gương mặt là đẹp, nhưng rốt cuộc đều tạo ra sự bắt mắt, thuận nhìn."))
          //           ],
          //         ),
          //       )
          //     ],
          //   )),
          // ),
        ],
      ),
    ));
  }

  blockImage(BuildContext context) {
    return Image.asset("assets/images/cham.jpg");
  }

  blockTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0), // tren duoi trai phai, khoang cach
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Truong Dai Hoc Khoa Hoc",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "77 Nguyen Hue, Tp Huế",
                style: TextStyle(fontSize: 15, color: Colors.black45),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
                size: 30,
              ),
              Text(
                "124",
                style: TextStyle(fontSize: 30, color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }

  blockButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button("call", Icons.phone),
        button("call", Icons.near_me),
        button("call", Icons.share),
      ],
    );
  }

  button(String title, IconData iconData) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.blueAccent,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
        )
      ],
    );
  }

  blockDes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        content,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
