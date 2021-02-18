import 'package:animated_text_kit/animated_text_kit.dart';
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
  Animation animation; // создаем анимацию для нашего нашего кода

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, // это наш тикер можно посмотреть на фото в папках или открыть сайт курса
      // upperBound: 100, // Когда мы используем CurvedAnimation мы не должные испльзовать upperBound
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad); // зайдя в документацию нам очень показательно покажут многие способы анимации

    animation = ColorTween(begin: Colors.blueGrey.shade900, end: Colors.white).animate(controller); // тут мы создали анимацию для смены цветов(двух состоянии)

    controller.forward();

    // animation.addStatusListener((status) {
    //   // создается для того чтобы понять увеличивать и уменьшать анимацию
    //   if (status == AnimationStatus.completed) {
    //     // благодаря этому условию мы увеличиваем и уменьшаем нашу иконку
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    //controller.reverse(from: 1.0); // таким образом мы не увеличиваем а уменьшаем нашу анимацию

    controller.addListener(() {
      setState(() {});
      print(animation.value); // 0.0 0.2... // благодаря этим цифрам мы меняем состояние цвета или размера ---создаем анимацию
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value, // добавив суда наш контролер мы получаем плавный переход
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
                    // height: animation.value * 100, //влияем на размер иконки --очень красиво увеличиваеться размер
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  // '${controller.value.toInt()}%', // вместо текста мы сделали так чтобы загружались проценты до (100%)
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            buildPadding(context, 'Log In', LoginScreen.id, Colors.lightBlueAccent),
            buildPadding(context, 'Register', RegistrationScreen.id, Colors.blueAccent),
          ],
        ),
      ),
    );
  }

  Padding buildPadding(BuildContext context, String textName, String idName, Color colorName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colorName,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, idName); // таким образом мы вызываем экран логирования
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textName,
          ),
        ),
      ),
    );
  }
}
