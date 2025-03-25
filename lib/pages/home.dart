import "package:flutter/material.dart";
import "package:deliveryapp/pages/details.dart";
import "package:deliveryapp/widgets/widget_support.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  bool iceCream = false;
  bool pizza = false;
  bool salad = false;
  bool burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Hello Guys',
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Delicious Food',
                  style: AppWidget.headlineTextFeildStyle(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Discover and Get the Best Food',
                  style: AppWidget.lightTextFeildStyle(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: showItem(),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                // to make it scroll
                scrollDirection: Axis.horizontal, // to make it scroll
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/salad2.png',
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Veggie taco Hash',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Fresh and Healthy',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$25',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/salad2.png',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Mix Veg Salad',
                                style: AppWidget.semiBoldTextFeildStyle(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Spicy with Onion',
                                style: AppWidget.lightTextFeildStyle(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$25',
                                style: AppWidget.semiBoldTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/salad2.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Mediterranean Chickpea Salad',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Honey Goot Cheese',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  '\$28',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/salad2.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Mediterranean Chickpea Salad',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Honey Goot Cheese',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  '\$28',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: iceCream ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/ice-cream.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: iceCream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/pizza.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: salad ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/salad.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
