import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:ecommerce_application/features/auth/home/widgets/address_box.dart';
import 'package:ecommerce_application/features/auth/home/widgets/carousel_image.dart';
import 'package:ecommerce_application/features/auth/home/widgets/deal_ofthe_day.dart';
import 'package:ecommerce_application/features/auth/home/widgets/top_categories.dart';
import 'package:ecommerce_application/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
              flexibleSpace: Container(
                decoration:
                    const BoxDecoration(gradient: GlobalColors.appBarGradient),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.only(left: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: (){},
                              child: Icon(Icons.search, color: Colors.black,size: 22,),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide(color: Colors.black38, width: 1),
                            ),
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 17, color: Colors.black54)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(Icons.mic, size: 25,),
                  ) 
                ],
              ),
            ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            TopCategories(),
            CarouselImage(),
            DealOftheDay(),
            Text(user.toJson()),
        
          ],
        ),
      )
      
    );
  }
}