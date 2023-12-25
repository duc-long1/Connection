import 'package:connection/ui/AppConstant.dart';
import 'package:connection/ui/Page_Forgot.dart';
import 'package:connection/ui/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';

class PageLogin extends StatelessWidget {
  PageLogin({super.key});
  static String routename = '/login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3) {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.popAndPushNamed(context, PageMain.routename);
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Xin chào!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Đây là giao diện để cho bạn đăng nhập !",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: "Username",
                      textController: _emailController,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Mật khẩu",
                      textController: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      viewmodel.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        String username = _emailController.text.trim();
                        String password = _passwordController.text;
                        viewmodel.login(username, password);
                      },
                      child: const Custombutton(
                        textButton: "Đăng nhập",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Chưa có tài khoản "),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .popAndPushNamed(PageRegister.routename),
                          child: Text(
                            "Đăng ký",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[300],
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed(PageForgot.routeName),
                      child: Text(
                        "Quên mật khẩu!",
                        style: AppConstant.textlink,
                      ),
                    )
                  ],
                ),
              ),
              viewmodel.status == 1 ? CustomSpinner(size: size) : Container(),
            ],
          ),
        ),
      )),
    );
  }
}
