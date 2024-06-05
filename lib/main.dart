import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _select_navigation = 0;

  Widget switchBody(){
    if(_select_navigation == 0){
      return mainPage();
    } else if(_select_navigation == 1){
      return messagePage();
    } else if(_select_navigation == 2){
      return findPage();
    } else {
      return minePage();
    }
  }

  Widget minePage(){
    return Column(children: [

    ],);
  }

  Widget findPage(){
    return GestureDetector(//点击事件装饰器
        onTapDown: (e){
          print("click");
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
          decoration: const BoxDecoration(color: Color(0xff7799ff), borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Text("发现界面", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
        ));
  }

  Widget messagePage(){
    return GestureDetector(//点击事件
        onTapDown: (e){
          print("click");
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
          decoration: const BoxDecoration(color: Color(0xff7799ff), borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Text("消息界面", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
        ));
  }
  
  Widget mainPage(){
    return GestureDetector(//点击事件
      onTapDown: (e){
        print("click");
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
        decoration: const BoxDecoration(color: Color(0xff7799ff), borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Text("首页", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
      ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架之类的
      appBar: AppBar(//头部导航
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(//主体
        child: switchBody()
      ),
      drawer: const Drawer(
        elevation: 25.0,
        child: Column(
            children: [
              Image(image: AssetImage("res/img/bg.png")),
              Padding(padding: EdgeInsets.all(4)),
              Row(children: [
                Padding(padding: EdgeInsets.all(4)),
                Icon(Icons.lock),
                Padding(padding: EdgeInsets.all(4)),
                Text("修改密码")
              ]),
              Padding(padding: EdgeInsets.all(4))
            ],
        )
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "首页"),
        NavigationDestination(icon: Icon(Icons.message), label: "消息"),
        NavigationDestination(icon: Icon(Icons.add), label: "发现"),
        NavigationDestination(icon: Icon(Icons.account_circle), label: "用户")
      ], selectedIndex: _select_navigation, onDestinationSelected: (int index){
        setState(() {
          _select_navigation = index;
        });
      }),
    );
  }
}
