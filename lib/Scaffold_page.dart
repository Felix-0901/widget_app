import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppBarPage())
              );
            },
            child: Text("AppBar")
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FloatButtonPage())
              );
            },
            child: Text("FloatButton")
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrawerPage())
              );
            },
            child: Text("Drawer")
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBarPage())
              );
            },
            child: Text("BottomBar")
          ),

          SizedBox(
            height: 10,
          ),

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left,
              size: 40,
            )
          )
        ],
      ),
    ),
   );
  }
}

//------------------------------------------------------------

class AppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppBarPageState();
  }
}

class _AppBarPageState extends State<AppBarPage> {
  var is_TitleCenter = true;
  var is_Scrollable = false;
  var is_physics = true;

  ScrollPhysics PhysicsChoose(var check) {
    if(check) {
      return AlwaysScrollableScrollPhysics();
    }
    else {
      return NeverScrollableScrollPhysics();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: is_TitleCenter,
          // 因為使用 Navigator 切換頁面
          // 因此 leading 預設為返回符號
          // 功能為 Navigator.pop()
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  is_TitleCenter = !is_TitleCenter;
                });
              }, 
              icon: Icon(Icons.change_circle)
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  is_Scrollable = !is_Scrollable;
                });
              },
              onLongPress: () {
                setState(() {
                  is_physics = !is_physics;
                });
              },
              icon: Icon(Icons.settings)
            ),
          ],
          bottom: TabBar(
            isScrollable: is_Scrollable,
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Settings"),
              Tab(text: "Data"),   
              Tab(text: "Preference"),   
              Tab(text: "Profile"),   
            ],
          ),
        ),
        body: TabBarView(
          physics: PhysicsChoose(is_physics),
          children: [
            HomePage(),
            SettingsPage(),
            DataPage(),
            PreferencePage(),
            ProfilePage(),
          ],
        ),
      )
    );
  }
}

//------------------------------------------------------------

class FloatButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatButtonPageState();
  }
}

class _FloatButtonPageState extends State<FloatButtonPage> {
  var num = 0;
  var locate_change = 1;
  var locate = [
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.startFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                locate_change++;
              });
            },
            icon: Icon(Icons.swap_horiz),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            num++;
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: locate[locate_change % 3],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Clicks",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              num.toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            ),

            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerPageState();
  }
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: 250.0,
        child: ListView(
          children: [
            Text(
              " DrawerHeader",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),

            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    "AliceEamil@example.com",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              )
            ),

            Text(
              " UserAccountsDrawerHeader",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),

            UserAccountsDrawerHeader(
              accountName: Text(
                "Alice",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                "AliceEamil@example.com",
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),

            ListTile(
              leading: Icon(Icons.schedule),
              title: Text("Recent information"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Itinerary"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Trash can"),
            ),
            ListTile(
              leading: Icon(Icons.splitscreen),
              title: Text("Storage space"),
              subtitle: Text("Use: 6.62 GB"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Main Screen"),
      )
    );
  }
}

//------------------------------------------------------------

class BottomBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomBarPageState();
  }
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (_num) {
          setState(() {
            _currentIndex = _num;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

//------------------------------------------------------------

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Page")
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings Page")
    );
  }
}
class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Data Page")
    );
  }
}
class PreferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Preference Page")
    );
  }
}
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Page")
    );
  }
}