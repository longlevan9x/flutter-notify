import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.light,
                accentColor: Colors.red,
                iconTheme: IconThemeData(color: Colors.red)
            ),
            home: LoginPage(),
        );
    }
}

class LoginPage extends StatefulWidget {
    @override
    LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            body: LoginForm(),
        );
    }
}

class LoginForm extends StatefulWidget {
    @override
    LoginFormState createState() {
        return LoginFormState();
    }
}

class LoginFormState extends State<LoginForm> {
    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        // Build a Form widget using the _formKey created above.
        return Form(
            key: _formKey,
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset("bell.png", width: 150, alignment: Alignment.topCenter),
                        Text("Uneti Notification"),
                        TextFormField(cursorColor: Theme
                            .of(context)
                            .cursorColor, initialValue: '',
//                maxLength: 20,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false),
                            decoration: InputDecoration(
                                labelText: 'Mã sinh viên',
                                labelStyle: TextStyle(
                                    color: Color(0xFF6200EE),
                                ),
//                  helperText: 'Helper text',
//                  suffixIcon: Icon(
//                    Icons.check_circle,
//                  ),
                                border: OutlineInputBorder(),
                            )
                        ),
                        RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xFF6200EE),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()),
                                );
                            },
                            child: Text('Đăng nhập'),
                        )
                    ],
                )
            )
        );
    }
}

class MainPage extends StatefulWidget {
    @override
    MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
    int _selectedIndex = 0;
    static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<TabNavigationItem> tabItems = <TabNavigationItem>[
        TabNavigationItem(page: HomePage()),
        TabNavigationItem(page: StudySchedule()),
        TabNavigationItem(page: ExamSchedule()),
        TabNavigationItem(page: InfoStudent()),
    ];

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Trang chủ'),
                    ),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("study_schedule.png")),
                        title: Text('Lịch học'),
                    ),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("exam_schedule.png")),
                        title: Text('Lịch thi')
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.school),
                        title: Text('TT sinh viên')
                    ),
                ],
                showUnselectedLabels: true,
                unselectedItemColor: Colors.cyan,
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
            ),
            body: IndexedStack(index: _selectedIndex, children: <Widget>[for (final tabItem in tabItems) tabItem.page, ])
        );
    }
}

class TabNavigationItem {
    final Widget page;

    TabNavigationItem({@required this.page});
}

class HomePage extends StatefulWidget {
    @override
    HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
    static Route<dynamic> route() => MaterialPageRoute(builder: (context) => HomePage());

    @override
    Widget build(BuildContext context) {
        final _width = MediaQuery
            .of(context)
            .size
            .width * 0.3;
        return Scaffold(
            body: ListView(children: <Widget>[
                Column(
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Row(children: <Widget>[
                                new Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            alignment: Alignment.center,
                                            repeat: ImageRepeat.noRepeat,
                                            image: AssetImage('bell.png')
                                        )
                                    )
                                ),

                                Column(
                                    children: <Widget>[
                                        Text("MSSV"),
                                        Text("Mã lớp"),
                                        Text("Mã lớp"),
                                        Padding(padding: const EdgeInsets.all(10), child: Text("Mã lớp"))
                                    ],
                                )
                            ])
                        ),
                        Wrap(
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                                homeCard(_width, "exam_schedule.png", "Lịch thi"),
                                homeCard(_width, "study_schedule.png", "Lịch học"),
                                homeCard(_width, "study_schedule.png", "Tin tức"),
                                homeCard(_width, "study_schedule.png", "Công nợ"),
                                homeCard(_width, "study_schedule.png", "TT sinh viên"),
                                homeCard(_width, "study_schedule.png", "Điểm rèn luyện"),
                                homeCard(_width, "study_schedule.png", "Kết quả học tập"),
                                homeCard(_width, "study_schedule.png", "Giờ học"),
                            ],
                        )
                    ]
                )
            ]),
        );
    }

    Widget homeCard(_width, image, text) {
        return GestureDetector(
            onTap: () {},
            child: Container(
                child: Stack(
                    children: <Widget>[
                        Center(child: new Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    repeat: ImageRepeat.noRepeat,
                                    image: AssetImage(image)
                                )
                            )
                        )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                                children: <Widget>[
//                                Container(width: 100.0, color: Colors.white, height: 30.0,alignment: Alignment.bottomCenter,),
                                    Text(text)
                                ],
                            ),
                        )
                    ]),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    color: Colors.white,
                ),
                height: _width,
                width: _width,
            ),
        );
    }
}

class StudySchedule extends StatefulWidget {
    @override
    StudyScheduleState createState() => StudyScheduleState();

}

class StudyScheduleState extends State<StudySchedule> {
    int _selectedIndex = 0;
    double _height = 50;

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    Color _getDayColor(int index) {
        return _selectedIndex == index ? Colors.amber : Colors.white;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Lịch học"),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage())),
                ),
                centerTitle: true,
            ),
            body: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(0);
                                },
                                child: Container(
                                    color: _getDayColor(0),
                                    height: _height,
                                    child: Center(child: Text("T2")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(1);
                                },
                                child: Container(
                                    color: _getDayColor(1),
                                    height: _height,
                                    child: Center(child: Text("T3")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(2);
                                },
                                child: Container(
                                    color: _getDayColor(2),
                                    height: _height,
                                    child: Center(child: Text("T4")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(3);
                                },
                                child: Container(
                                    color: _getDayColor(3),
                                    height: _height,
                                    child: Center(child: Text("T5")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(4);
                                },
                                child: Container(
                                    color: _getDayColor(4),
                                    height: _height,
                                    child: Center(child: Text("T6")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(5);
                                },
                                child: Container(
                                    color: _getDayColor(5),
                                    height: _height,
                                    child: Center(child: Text("T7")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(6);
                                },
                                child: Container(
                                    color: _getDayColor(6),
                                    height: _height,
                                    child: Center(child: Text("CN")),
                                )
                            )
                        ),
                    ],
                ),
                Expanded(
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                            Card(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                        Text("Sáng"),
                                        Card(
                                            elevation: 0,
                                            clipBehavior: Clip.antiAlias,
                                            shape: Border.all(color: Colors.lightBlue),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                    Text("Tiết 1 - 3"),
                                                    Text("Mã Lớp: 1231321321"),
                                                    Text("Kỹ thuật truyền số liệu"),
                                                    Text("HA.105"),
                                                    Text("Đặng Kiều Linh"),
                                                    Text("Từ: 10-08-2015"),
                                                    Text("Đến: 10-08-2015"),

                                                ],
                                            ),
                                        ), Card(
                                            elevation: 0,
                                            clipBehavior: Clip.antiAlias,
                                            shape: Border.all(color: Colors.lightBlue),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                    Text("Tiết 1 - 3"),
                                                    Text("Mã Lớp: 1231321321"),
                                                    Text("Kỹ thuật truyền số liệu"),
                                                    Text("HA.105"),
                                                    Text("Đặng Kiều Linh"),
                                                    Text("Từ: 10-08-2015"),
                                                    Text("Đến: 10-08-2015"),

                                                ],
                                            ),
                                        ),

                                    ]
                                )
                            ),
                            Card(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                        Text("Chiều"),
                                        Card(
                                            elevation: 0,
                                            clipBehavior: Clip.antiAlias,
                                            shape: Border.all(color: Colors.lightBlue),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                    Text("Tiết 1 - 3"),
                                                    Text("Mã Lớp: 1231321321"),
                                                    Text("Kỹ thuật truyền số liệu"),
                                                    Text("HA.105"),
                                                    Text("Đặng Kiều Linh"),
                                                    Text("Từ: 10-08-2015"),
                                                    Text("Đến: 10-08-2015"),

                                                ],
                                            ),
                                        ), Card(
                                            elevation: 0,
                                            clipBehavior: Clip.antiAlias,
                                            shape: Border.all(color: Colors.lightBlue),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                    Text("Tiết 1 - 3"),
                                                    Text("Mã Lớp: 1231321321"),
                                                    Text("Kỹ thuật truyền số liệu"),
                                                    Text("HA.105"),
                                                    Text("Đặng Kiều Linh"),
                                                    Text("Từ: 10-08-2015"),
                                                    Text("Đến: 10-08-2015"),

                                                ],
                                            ),
                                        ),

                                    ]
                                )
                            ),

                        ],
                    )
                )
            ])
        );
    }
}

class ExamSchedule extends StatefulWidget {
    @override
    ExamScheduleState createState() => ExamScheduleState();

}

class ExamScheduleState extends State<ExamSchedule> {
    int _selectedIndex = 0;
    double _height = 50;

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    Color _getDayColor(int index) {
        return _selectedIndex == index ? Colors.amber : Colors.white;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Lịch thi"),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage())),
                ),
                centerTitle: true,
            ),
            body: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(0);
                                },
                                child: Container(
                                    color: _getDayColor(0),
                                    height: _height,
                                    child: Center(child: Text("T2")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(1);
                                },
                                child: Container(
                                    color: _getDayColor(1),
                                    height: _height,
                                    child: Center(child: Text("T3")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(2);
                                },
                                child: Container(
                                    color: _getDayColor(2),
                                    height: _height,
                                    child: Center(child: Text("T4")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(3);
                                },
                                child: Container(
                                    color: _getDayColor(3),
                                    height: _height,
                                    child: Center(child: Text("T5")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(4);
                                },
                                child: Container(
                                    color: _getDayColor(4),
                                    height: _height,
                                    child: Center(child: Text("T6")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(5);
                                },
                                child: Container(
                                    color: _getDayColor(5),
                                    height: _height,
                                    child: Center(child: Text("T7")),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                    _onItemTapped(6);
                                },
                                child: Container(
                                    color: _getDayColor(6),
                                    height: _height,
                                    child: Center(child: Text("CN")),
                                )
                            )
                        ),
                    ],
                ),
                Expanded(
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                            Text("A"),
                            Text("A"),
                            Text("A"),
                            Text("A"),
                            Text("A"),
                            Text("A"),
                            Text("A"),
                            Text("A"),
                        ],
                    )
                )
            ])
        );
    }
}

class InfoStudent extends StatefulWidget {
    @override
    InfoStudentState createState() => InfoStudentState();

}

class InfoStudentState extends State<InfoStudent> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(body: Text("Info"));
    }
}