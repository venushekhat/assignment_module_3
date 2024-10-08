import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/Stripe_Services.dart';
import 'package:food_delivery/Widget/support_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController amountcontroller = TextEditingController();

  getthesharedpref() async {
    // wallet = await SharedPreferenceHelper().getUserWallet();
    // id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: AppWidget.HeadlineTextFeildStyle(),
                    )))),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.LightTextFeildStyle(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "\$0",
                        style: AppWidget.boldTextFeildStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: AppWidget.SemiBoldTextFeildStyle(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    StripeServices.instance.makepayments();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" "100",
                      style: AppWidget.SemiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    StripeServices.instance.makepayments();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" "500",
                      style: AppWidget.SemiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    StripeServices.instance.makepayments();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" "1000",
                      style: AppWidget.SemiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    StripeServices.instance.makepayments();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" "2000",
                      style: AppWidget.SemiBoldTextFeildStyle(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                StripeServices.instance.makepayments();
              },
              child: GestureDetector(
                onTap: () {
                  openEdit();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFF008080),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.cancel)),
                        const SizedBox(
                          width: 60,
                        ),
                        const Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                                color: Color(0xFF008080),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Amount"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: amountcontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter Amount"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // StripeServices.makepayments(amountcontroller.text);
                        StripeServices.instance.makepayments(
                            text: int.parse(amountcontroller.text));
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF008080),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Pay",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
