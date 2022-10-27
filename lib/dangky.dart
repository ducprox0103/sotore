import 'package:appdemo/login_dien.dart';
import 'package:flutter/material.dart';

class LoginPage3 extends StatelessWidget {
  LoginPage3({Key? key}) : super(key: key);
  var userNameControler = TextEditingController();
  var passWordControler = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String src = 'assets/images/anhdien.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Đăng nhập hệ thống"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userNameControler,
                  decoration: InputDecoration(
                      label: Text("Tên đăng nhập"),
                      hintText: "Vui lòng nhập tên đăng nhập",
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.person)),
                  validator: (str) {
                    if (str == null || str.isEmpty)
                      return "Tên đăng nhập không được rỗng";
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passWordControler,
                  decoration: InputDecoration(
                    label: Text("Mật khẩu"),
                    hintText: "Vui lòng nhập mật khẩu",
                    prefixIcon: Icon(Icons.key),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (password) {
                    if (password == null || password.isEmpty)
                      return "Mật khẩu rỗng";
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passWordControler,
                  decoration: InputDecoration(
                    label: Text(" Xác Nhận Mật khẩu"),
                    hintText: "Vui lòng xác nhận  mật khẩu",
                    prefixIcon: Icon(Icons.key),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (password) {
                    if (password == null || password.isEmpty)
                      return "Mật khẩu rỗng";
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.orange)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var userName = userNameControler.text;
                        print("Xin chào ${userName}");
                      } else {
                        print("Dữ liệu không chính xác");
                      }
                    },
                    child: Text("Đăng Ký")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage2()),
                      );
                    },
                    child: Text("Quay về")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
