// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ivs_admin/pages/create_user.dart';
import 'package:ivs_admin/pages/password.dart';

class CreateUserProfile extends StatefulWidget {
  const CreateUserProfile({Key? key}) : super(key: key);

  @override
  State<CreateUserProfile> createState() => _CreateUserProfileState();
}

class _CreateUserProfileState extends State<CreateUserProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobilenumbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController pincodecontroller = TextEditingController();
  final TextEditingController totalamountcontroller = TextEditingController();

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
////////////////////////////////////////////////////////////////////////////////

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

////////////////////////////////////////////////////////////////////////////////

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

////////////////////////////////////////////////////////////////////////////////

  String selectedCustomerbranch = 'chennai';
  String selectedPaymentMode = 'Credit Card';
  String selectedCustomercountry = 'india';
  String selectedCity = 'Mumbai';
  String selectedState = 'Maharashtra';

////////////////////////////////////////////////////////////////////////////////
  DateTime? _selectedDate;

  Future<void> _selectFromDate() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year, now.month, now.day);
    DateTime lastDate = firstDate.add(const Duration(days: 30 * 3));

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _startDateController.text = formattedDate;
      });
    }
  }

  Future<void> _selectToDate() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year, now.month, now.day);
    DateTime lastDate =
        firstDate.add(const Duration(days: 30 * 3)); // Add 3 months

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _toDateController.text = formattedDate;
      });
    }
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreateUser(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.west_outlined,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 59),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Create',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'User Profile',
                              style: GoogleFonts.montserrat(
                                color: const Color.fromRGBO(43, 135, 97, 0.94),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: mobilenumbercontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value.length < 10) {
                              return 'Please enter a 10-digit number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          value: selectedCustomerbranch,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCustomerbranch = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Customer branch',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          icon: const Icon(
                            Icons
                                .arrow_drop_down, // You can change this to any other icon
                            color: Color.fromRGBO(43, 135, 97,
                                1), // Change the color of the dropdown icon
                          ),
                          items: [
                            'chennai',
                            'kovai',
                            'trichy',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors
                                        .black), // Set the style for the dropdown item
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: addresscontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: DropdownButtonFormField<String>(
                                  value: selectedCity,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCity = newValue!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'City',
                                    hintStyle: GoogleFonts.commissioner(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          43, 135, 97, 0.94),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(43, 135, 97, 1),
                                        width: 1.5,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(43, 135, 97, 1),
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons
                                        .arrow_drop_down, // You can change this to any other icon
                                    color: Color.fromRGBO(43, 135, 97,
                                        1), // Change the color of the dropdown icon
                                  ),
                                  items: [
                                    'Mumbai',
                                    'Delhi',
                                    'Bangalore',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: DropdownButtonFormField<String>(
                                  value: selectedState,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedState = newValue!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'State',
                                    hintStyle: GoogleFonts.commissioner(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          43, 135, 97, 0.94),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(43, 135, 97, 1),
                                        width: 1.5,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(43, 135, 97, 1),
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons
                                        .arrow_drop_down, // You can change this to any other icon
                                    color: Color.fromRGBO(43, 135, 97,
                                        1), // Change the color of the dropdown icon
                                  ),
                                  items: [
                                    'Maharashtra',
                                    'Delhi',
                                    'Karnataka',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          value: selectedCustomercountry,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCustomercountry = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Country',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          icon: const Icon(
                            Icons
                                .arrow_drop_down, // You can change this to any other icon
                            color: Color.fromRGBO(43, 135, 97,
                                1), // Change the color of the dropdown icon
                          ),
                          items: [
                            'india',
                            'pakistan',
                            'Russia',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors
                                        .black), // Set the style for the dropdown item
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: pincodecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value.length < 10) {
                              return 'Please enter a 6-digit pin code';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Pincode',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
   ////////////////////////////////////////////////////////////////////////////////////
                        Container(
                          height: 58,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(43, 135, 97, 1),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkbox1,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbox1 = value ?? false;
                                      });
                                    },
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        // Set the checkbox color based on its state
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const Color.fromRGBO(43, 135,
                                              97, 1); // Color when selected
                                        }
                                        return Colors
                                            .white; // Color when not selected
                                      },
                                    ),
                                    side: const BorderSide(
                                      color: Color.fromRGBO(
                                          43, 135, 97, 1), // Border color
                                      width: 1.0,
                                    ),
                                  ),
                                  const Text(
                                    'Breakfast',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkbox2,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbox2 = value ?? false;
                                      });
                                    },
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        // Set the checkbox color based on its state
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const Color.fromRGBO(43, 135,
                                              97, 1); // Color when selected
                                        }
                                        return Colors
                                            .white; // Color when not selected
                                      },
                                    ),
                                    side: const BorderSide(
                                      color: Color.fromRGBO(
                                          43, 135, 97, 1), // Border color
                                      width: 1.0,
                                    ),
                                  ),
                                  const Text(
                                    'Lunch',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkbox3,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbox3 = value ?? false;
                                      });
                                    },
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        // Set the checkbox color based on its state
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const Color.fromRGBO(43, 135,
                                              97, 1); // Color when selected
                                        }
                                        return Colors
                                            .white; // Color when not selected
                                      },
                                    ),
                                    side: const BorderSide(
                                      color: Color.fromRGBO(
                                          43, 135, 97, 1), // Border color
                                      width: 1.0,
                                    ),
                                  ),
                                  const Text(
                                    'Dinner',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                controller: _startDateController,
                                decoration: InputDecoration(
                                  hintText: 'From Date',
                                  hintStyle: GoogleFonts.commissioner(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(43, 135, 97, 0.94),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    color: const Color.fromRGBO(43, 135, 97, 1),
                                    onPressed: _selectFromDate,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                controller: _toDateController,
                                decoration: InputDecoration(
                                  hintText: 'To Date',
                                  hintStyle: GoogleFonts.commissioner(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(43, 135, 97, 0.94),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(43, 135, 97, 1),
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    color: const Color.fromRGBO(43, 135, 97, 1),
                                    onPressed: _selectToDate,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          value: selectedPaymentMode,
                          onChanged: (newValue) {
                            setState(() {
                              selectedPaymentMode = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          dropdownColor: Colors
                              .white, // Set the background color of the dropdown
                          decoration: InputDecoration(
                            hintText: 'Mode of Payment',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          icon: const Icon(
                            Icons
                                .arrow_drop_down, // You can change this to any other icon
                            color: Color.fromRGBO(43, 135, 97,
                                1), // Change the color of the dropdown icon
                          ),
                          items: [
                            'Credit Card',
                            'Debit Card',
                            'Online Banking',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors
                                        .black), // Set the style for the dropdown item
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: totalamountcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Allow only numeric input
                          ],
                          decoration: InputDecoration(
                            hintText: 'Total Amount',
                            hintStyle: GoogleFonts.commissioner(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(43, 135, 97, 0.94),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(43, 135, 97, 1),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),

////////////////////////////////////////////////////////////////////////////////

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color.fromRGBO(43, 135, 97, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Password(),
                        ),
                      );
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
