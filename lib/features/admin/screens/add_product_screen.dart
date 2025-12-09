import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_application/common/widgets/custom_button.dart';
import 'package:ecommerce_application/common/widgets/custum_textfield.dart';
import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:ecommerce_application/constants/utils.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  String category = 'Mobiles';
  List<File> images = [];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: CustomButton(text: 'Sell', onTap: (){}),
        ),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: GlobalColors.appBarGradient),
                ),
                title: const Text('Add Product'))),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                images.isNotEmpty ? CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0, 
        enableInfiniteScroll: true,
        // autoPlay: true,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Image.file(
                i,
                fit: BoxFit.cover,
                height: 200,
              ),
            );
          },
        );
      }).toList(),
    ) :GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [10, 4],
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: mq.height * 0.2,
                        width: mq.width * 0.9,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.folder_open_outlined,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Select Product Image',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                CustomTextFormField(controller: productNameController, hintText: 'Product name'),
                const SizedBox(height: 10,),
                CustomTextFormField(controller: descriptionController, hintText: 'Description', maxLines: 6,),
                const SizedBox(height: 10,),
                CustomTextFormField(controller: priceController, hintText: 'Price'),
                const SizedBox(height: 10,),
                CustomTextFormField(controller: quantityController, hintText: 'Quantity'),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item){
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item)
                          );
                    }).toList(), 
                    onChanged: (String? newVal){
                      setState(() {
                        category = newVal!;
                      });
                    }
                    ),
                ),
                
              ],
            ),
          )),
        ));
  }
}



