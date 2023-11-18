// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, Fachrul!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.notifications_none, size: 32),
                ],
              ),
              Text(
                "Find Your Dream Job",
                style: headerText(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PrimaryForm(
                    width: 300,
                    hintText: "Search",
                    prefixIcon: Icons.search,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5E73E1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryList.map((text) {
                    return CategoryCard(
                      text: text,
                      onTap: () {},
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Popular Job",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: popularJobList.map((data) {
                    return PopularJobCard(
                      category1: data['Category1']!,
                      category2: data['Category2']!,
                      category3: data['Category3']!,
                      company: data['Company']!,
                      location: data['Location']!,
                      logo: data['Logo']!,
                      position: data['Position']!,
                      salary: data['Salary']!,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Recommended Job",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(height: 16),
              GridView.count(
                childAspectRatio: 1.3,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: recomJobList.map((data) {
                  return RecomJobCard(
                    category: data['Category']!,
                    company: data['Company']!,
                    location: data['Location']!,
                    logo: data['Logo']!,
                    position: data['Position']!,
                  );
                }).toList(),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

TextStyle headerText() {
  return const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

class CategoryCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color textColor;
  const CategoryCard(
      {Key? key,
      required this.text,
      required this.onTap,
      this.bgColor = const Color(0xFF5E73E1),
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: bgColor),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          height: 25,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class PopularJobCard extends StatelessWidget {
  final String logo;
  final String salary;
  final String position;
  final String company;
  final String location;
  final String category1;
  final String category2;
  final String category3;

  const PopularJobCard(
      {Key? key,
      required this.logo,
      required this.salary,
      required this.position,
      required this.company,
      required this.location,
      required this.category1,
      required this.category2,
      required this.category3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFF5E73E1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.scaleDown, image: AssetImage(logo)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Text(salary,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(position,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("$company - $location",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                    onTap: () {},
                    text: category1,
                    bgColor: Colors.white,
                    textColor: const Color(0xFF5E73E1),
                  ),
                  CategoryCard(
                    onTap: () {},
                    text: category2,
                    bgColor: Colors.white,
                    textColor: const Color(0xFF5E73E1),
                  ),
                  CategoryCard(
                    onTap: () {},
                    text: category3,
                    bgColor: Colors.white,
                    textColor: const Color(0xFF5E73E1),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecomJobCard extends StatelessWidget {
  final String logo;
  final String position;
  final String company;
  final String location;
  final String category;
  const RecomJobCard(
      {Key? key,
      required this.logo,
      required this.position,
      required this.company,
      required this.location,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: const Offset(3, 5)),
            ],
            color: const Color(0xFFF6F6F6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.scaleDown, image: AssetImage(logo)),
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(category,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              position,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                Text(location,
                    style: const TextStyle(color: Colors.grey, fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<String> categoryList = [
  'IT',
  'Education',
  'Healthcare',
  'Industry',
  'Finance',
  'Marketing',
  'Design',
  'Others'
];

List<Map<String, String>> popularJobList = [
  {
    'Logo': 'assets/img/google.png',
    'Salary': '\$30k - \$70k',
    'Position': 'SEO Specialist',
    'Company': 'Google',
    'Location': 'USA',
    'Category1': 'Full Time',
    'Category2': 'Anywhere',
    'Category3': 'Remote',
  },
  {
    'Logo': 'assets/img/spacex.png',
    'Salary': '\$100k - \$350k',
    'Position': 'Rocket Engineer',
    'Company': 'SpaceX',
    'Location': 'USA',
    'Category1': 'Onsite',
    'Category2': 'Engineer',
    'Category3': 'Full Time',
  },
];

List<Map<String, String>> recomJobList = [
  {
    'Logo': 'assets/img/tokopedia.png',
    'Position': 'Sr. UI Designer',
    'Company': 'Tokopedia',
    'Location': 'Jakarta, Indonesia',
    'Category': 'Onsite',
  },
  {
    'Logo': 'assets/img/gojek.png',
    'Position': 'Software Engineer',
    'Company': 'Gojek',
    'Location': 'Jakarta, Indonesia',
    'Category': 'Onsite',
  },
  {
    'Logo': 'assets/img/youtube.png',
    'Position': 'Project Manager',
    'Company': 'Youtube',
    'Location': 'California, USA',
    'Category': 'Onsite',
  },
  {
    'Logo': 'assets/img/shopee.png',
    'Position': 'UI UX Designer',
    'Company': 'Shopee',
    'Location': 'Singapore',
    'Category': 'Remote',
  },
  {
    'Logo': 'assets/img/X.png',
    'Position': 'Project Manager',
    'Company': 'X',
    'Location': 'California, USA',
    'Category': 'Onsite',
  },
  {
    'Logo': 'assets/img/tiktok.png',
    'Position': 'Application Developer',
    'Company': 'Tiktok',
    'Location': 'California, USA',
    'Category': 'Onsite',
  },
  {
    'Logo': 'assets/img/facebook.png',
    'Position': 'Marketing Manager',
    'Company': 'Facebook',
    'Location': 'California, USA',
    'Category': 'Remote',
  },
];
