import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isError = true;

  List<String> imageList = [
    'https://images.unsplash.com/photo-1580910051074-3eb694886505?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBob25lfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://images.unsplash.com/photo-1598327105666-5b89351aff97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c21hcnRwaG9uZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzMG7NsZnjV-1lF6Qg4jEcQQhxzJ2GeLovzQ&usqp=CAU',
    'https://cdn.vox-cdn.com/thumbor/hM7iHM_6O-JbYPbZs09RjhcgD3U=/0x0:2050x1367/1200x1200/filters:focal(1025x684:1026x685)/cdn.vox-cdn.com/uploads/chorus_asset/file/22022572/bfarsace_201106_4269_012.0.jpg',
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvbmV8ZW58MHx8MHx8&w=1000&q=80',
    'https://images.unsplash.com/photo-1523206489230-c012c64b2b48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGhvbmV8ZW58MHx8MHx8&w=1000&q=80',
    'https://images.unsplash.com/photo-1612631674940-9fce036379c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBob25lJTIwYXQlMjBuaWdodHxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://media.wired.com/photos/6272ca8f95c3e2d8a63f2623/master/w_2400,h_1800,c_limit/Android-Phones-FairPhone4-Gear.jpg',
    'https://images.unsplash.com/photo-1612631674940-9fce036379c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBob25lJTIwYXQlMjBuaWdodHxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://cdn.vox-cdn.com/thumbor/hM7iHM_6O-JbYPbZs09RjhcgD3U=/0x0:2050x1367/1200x1200/filters:focal(1025x684:1026x685)/cdn.vox-cdn.com/uploads/chorus_asset/file/22022572/bfarsace_201106_4269_012.0.jpg',
  ];

  List<String> namesList = [
    'Samsung A7',
    'Iphone 11',
    'Samsung',
    'Huawei',
    'Iphone 12',
    'Iphone 13',
    'Samsung A12',
    'Iphone 14',
    'Huawei A4',
    'Oppo O9'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(namesList.length, (index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 4, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400, blurRadius: 4.5)
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      '\$123',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(imageList[index]),
                              backgroundColor: Colors.white,
                              radius: 55,
                              onBackgroundImageError: (exception, stackTrace) {
                                isError = true;
                              },
                              child: isError
                                  ? CircularProgressIndicator()
                                  : Text('image'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              namesList[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            )
          ],
        ));
  }
}

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("This is a snackbar message"),
              duration: const Duration(milliseconds: 1700),
              dismissDirection: DismissDirection.up,
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(15),
              behavior: SnackBarBehavior.floating,
              width: 380,
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {},
                textColor: Colors.black,
                disabledTextColor: Colors.pink,
              ),
            ));
          },
          child: const Text('Show snackbar')),
    );
  }
}
