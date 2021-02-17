import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen'; // эта статическая переменная была создана для навигации --- перехода не другие экраны

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  // Предоставляет один тикер, который устанавливается только на тикер, пока включено текущее дерево,
  //
  AnimationController controller; // это переменная нашего контроллера

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, // это наш тикер можно посмотреть на фото в папках или открыть сайт курса
      upperBound: 100,
    );
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value); // 0.0 0.2... // благодаря этим цифрам мы меняем состояние цвета или размера ---создаем анимацию
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // добавив суда наш контролер мы получаем плавный переход
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  '${controller.value.toInt()}%', // вместо текста мы сделали так чтобы загружались проценты до (100%)
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id); // таким образом мы вызываем экран логирования
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id); // таким образом мы вызываем экран регистарции
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
