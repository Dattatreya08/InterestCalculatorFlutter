import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Interest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Interest();
  }
}
class _Interest extends State<Interest>{
  double _minimumPadding=5.0;
  late String currentValue;
  void initState(){
    super.initState();
    currentValue="0 months";
  }
  TextEditingController timePeriodController=TextEditingController();
  TextEditingController principleController=TextEditingController();
  TextEditingController rateController=TextEditingController();
  var displayResult="";
  double result=0;
  List<String> _months=List<String>.generate(13, (index) => "$index months");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.menu,size: 25.0,
        //       color: Colors.white,semanticLabel: "menuBar",
        //     ),
        //     onPressed: (){}),
        title: Text("Simple Interest Calculator"),
        centerTitle: true,backgroundColor: Colors.deepPurple,
      ),
      body: Form(child: ListView(
        children: [
          Assetimage(),
          principle(),
          rate(),
          Padding(padding: EdgeInsets.all(_minimumPadding),child:Row(
            children: [

              Expanded(child: TextField(
                decoration: InputDecoration(icon: Icon(Icons.calendar_today),
                  labelText: "Time Period",hintText: "No.of Years",
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: timePeriodController,


              ),),
              Container(width: _minimumPadding*5,),
              Expanded(child: DropdownButton(
                items: _months.map((e) => DropdownMenuItem(child: Text(e),
                  value: e,
                )
                ).toList(),value:currentValue ,
                // onChanged: (newValue){
                //   setState(() {
                //     currentValue=newValue;
                //   });
                // },
              ),
              )
            ],
          ),),
          Center(child:Container(
            //width: ,
            child: ElevatedButton(onPressed: () {
              setState(() {
                displayResult=_calculate();
              });
            },
                child: Text("Calculate")
            ),
          ) ,
          ),
          //Container(height: 50,),
          Center(
              child: Container(
                child: Text("The Interest Is: $displayResult",
                  style: TextStyle(color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              )
          ),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.undo)
        ,tooltip: "Reset",foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        onPressed: (){
          deCalculate();
        },
      ),
    );
  }
  Widget Assetimage( ){
    AssetImage assetImage=AssetImage('images/money.png');
    Image image=Image(image: assetImage,
      width: 200.0,height: 200.0,repeat: ImageRepeat.noRepeat,);
    return Container(child: image,);
  }
  Widget principle(){
    return Padding(padding:EdgeInsets.all(
        _minimumPadding),
      child: TextField(
        decoration: InputDecoration(icon: Icon(Icons.monetization_on),
          labelText: "Principle",hintText: "Total Amount",
          border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
        ),
        keyboardType: TextInputType.number,
        controller: principleController,
      ),);
  }
  Widget rate(){
    return Padding(padding:EdgeInsets.all(
        _minimumPadding),
      child: TextField(
        decoration: InputDecoration(icon: Icon(Icons.monetization_on),
          labelText: "Rate",hintText: "Rate Of Interest",
          border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
        ),
        keyboardType: TextInputType.number,
        controller: rateController,
      ),
    );
  }
  String _calculate(){
    double principle=double.parse(principleController.text);
    double rate=double.parse(rateController.text);
    double timePeriod=double.parse(timePeriodController.text);
    result=principle+((principle*timePeriod*rate)/100);
    return "$result";
  }
  void deCalculate(){
    principleController.text="";
    rateController.text="";
    timePeriodController.text="";
  }
}