import 'package:flutter/material.dart';
import 'package:othering/controllers/product_controller.dart';
import 'package:othering/models/product_model.dart';

import 'widgets/input_text.dart';
import 'widgets/label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ProductController();
  final textCtrl = TextEditingController();
  void Function()? onTap;
  void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("The Ordering"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Label(
                text: 'Welcome to the Ordering!',
                fontFamily: Onest.semiBold,
                fontSize: 16,
              ),
              const Label(
                text: 'Now order what you want by yourself',
              ),
              const SizedBox(height: 16),
              const Label(
                text: 'Find what you want',
                fontFamily: Onest.light,
                fontSize: 13,
              ),
              const SizedBox(height: 4),
              InputText(controller: textCtrl),
              const SizedBox(height: 16),
              const Label(
                text: 'All Products',
                fontFamily: Onest.light,
                fontSize: 13,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                itemCount: controller.products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 290,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 28,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            fit: BoxFit.cover,
                            controller.products[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(
                                text: controller.products[index].name,
                                fontFamily: Onest.semiBold,
                                fontSize: 16,
                              ),
                              Label(
                                  text:
                                      '\$ ${controller.products[index].price}')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
