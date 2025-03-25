import 'package:flutter/material.dart';
import 'package:deliveryapp/widgets/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'images/salad2.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mediterranean',
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                    Text(
                      'Chicken Salad',
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      --count;
                    }
                      setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  count.toString(),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ++count;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcur. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.',
              maxLines: 5,
              style: AppWidget.lightTextFeildStyle(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Delivery Time:-',
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                SizedBox(width: 5),
                Text(
                  '30 min',
                  style: AppWidget.semiBoldTextFeildStyle(),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                    Text(
                      '\$28.00',
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    )
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
