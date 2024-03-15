import 'package:flutter/material.dart';

// b1 tao 1 class ke thua tu inherited widget
class MyInheritWidget extends InheritedWidget{
  final int data;
  const MyInheritWidget({required this.data, required Widget child}): super(child: child);
  //Ham update - kiem tra xem co can update khong
  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
    return oldWidget.data != data;
  }
  //b2 tao 1 phuong thuc lay du lieu tu myinhertitedwidget
  static MyInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritWidget>();
  }
}

//dinh nghia widget can su dung MyInheritWidget
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context){
    //Su dung inherit widget
    final data = MyInheritWidget.of(context)!.data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Du lieu truyen tu cha: $data'),
        SizedBox(height: 30,),
        MyChildWidget()
      ],
    );
  }
}

class MyChildWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final data = MyInheritWidget.of(context)!.data;
    return Text('Du lieu tu lop cao nhat $data');
  }
  
}

//Dinh nghia widget chua MyInheritWidget
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Vi du ve truyen du lieu')
            ),
            body: MyWidget(),
        )
    );
  }
}

//b3 su dung inherit widget o cap do cao nhat
void main(){
  runApp(MyInheritWidget(data: 50, child: MyApp()));
}