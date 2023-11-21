import 'package:our_app/util/resources/importss.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myUserSettings');

  // checks if all profile info has been inserted
  bool _checkBoxNotFull(){
    for(final f in fieldListUser){
      if(_myBox.get(f) == null){
        return true;
      }
    }
    return false;
  }

  @override
  void initState(){
    if(_myBox.isNotEmpty){
      myProfile.loadData();
      }
    super.initState();
    checkFirstSeen();
    }
 
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (!_seen || _checkBoxNotFull()) {
      await prefs.setBool('seen', true); 
      Navigator.pushNamed(context, '/profilepage');
    } 
  } 
  
    
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(),
        body: ListView(children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
            child: Center(child: Text("בחר את נושא הפנייה:",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
          ),
          MainButton(task: "לינה", routeName: '/sleeppage',),
          MainButton(task: "מבקרים", routeName: '/visitorpage',),
          MainButton(task: "תחזוקה", routeName: '/maintenancepage'),
          MainButton(task: "אתר המעונות", routeName: "https://meonot.shikunbinui.com/", link: true)
        ]),
      ),
    );
  }
}