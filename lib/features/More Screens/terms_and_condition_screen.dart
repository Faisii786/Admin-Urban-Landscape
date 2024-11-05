import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const CustomText(
          text: 'Terms & Condition',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomText(
          text:
              '''Terms & Conditions TERMS AND CONDITIONS OF FIX MY RIDE AUTO REPAIRS WORKSHOP 1. Definitions 1.1 The Company refers to FIX MY RIDE AUTO REPAIRS WORKSHOP 1.2 "The Buyer" refers to the customer, person, partnership, Limited Company, or other legal entity, who agrees to services being provided by the Company. 1.3 "The Conditions" refers to the terms and conditions of the Company's operations, set out in this document and any special terms and conditions agreed in writing by a Director, Company Secretary, or other member of this company's management team, acting for and on behalf of the Company. 2. Conditions 2.1 These Conditions shall apply to all contracts for any parts or service provided by the Company to the Buyer, to the exclusion of all other terms and conditions, including any terms and conditions the Buyer may purport to apply under any purchase order, confirmation of order, or similar document. 2.2 Agreement of any work to be carried out by the Company shall be deemed conclusive evidence of the Buyer's acceptance of these Conditions.
3. The Price and Payment 3.1 The price of the service provided shall be the price agreed between the Company and the Buyer, at the time the Buyer agrees to work being carried out. This price may vary, dependent upon any change in parts prices, or change in specialist charges, which may come into effect at the time the work is completed and which is beyond the control of the Company. The price of the work carried out is exclusive of VAT. Where applicable, VAT shall be due at the rate ruling on the date that the VAT invoice is drawn.
3.2 Payment of the price and VAT shall be due at point of collection/delivery of vehicle following completion of repairs, unless otherwise agreed, in writing, with the Company. Payment in this instance is generally agreed to be 30 days from date of invoice. 4. Orders / Estimates / Deposits 4.1 Estimates are valid for the date given. If instructions are not received from a customer (in response to an estimate rendered) within 24 hours, the Company may invoice for reasonable storage charges (not less than AED 50 per day) from the date that the vehicle was received until its collection.''',
          txtColor: Colors.black87,
          fontSize: 14,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
