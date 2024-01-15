import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自傳APP',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orangeAccent,
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.deepOrange,
              displayColor: Colors.blue,
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('自傳APP'),
          backgroundColor: Colors.deepOrange,
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepOrange,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.grey[400],
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '自我介紹',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: '專業方向',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
              if (index == 0) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('1.mp3'));
              }
              if (index == 1) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('2.mp3'));
              }
              if (index == 2) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('3.mp3'));
              }
              if (index == 3) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final String s1 =
      '我誕生在一個平凡卻幸福的小家庭，父親在台電服務，是一位公務員，而母親則是位貼心的家庭主婦。我和弟弟都在學校努力學習，父母以民主的方式教導我們，期望培養我們獨立自主的品格，並鼓勵我們積極參與生活，累積寶貴的人生經驗。他們強調兩項基本要求，首先是保持身體健康，其次是注重學業。因為他們深知，只有擁有健康的身體，才能充分發揮才華和實現抱負。由於家境不富裕，我們也被要求專注於學業，學習一技之長，為將來的自立奠定基礎。'
      '在小學時期，我活潑好動，雖然在課業上表現平平，但在課外活動方面取得不錯的成績。曾擔任過班長等幹部，參加樂隊、糾察隊，並有幸被選為校隊參加跳高比賽。小學畢業後，我進入了一所私立中學，校規嚴格使我轉變為較為文靜的個性，但在這段時期，我學到了禮節與待人處世的重要原則。在國中時，我代表學校接受了縣政府的表揚，並在國三畢業典禮上代表全體畢業生領取畢業證書。'
      '進入附中後，我的生活充實而快樂。附中學生以能K、能玩聞名，我不斷努力學習，希望達到這個目標。在課業方面，我能保持一定水準，因為我專心聽講、深思熟慮，積極參與老師的教學。我喜愛的科目包括數學、化學和生物，因為這些科目能夠培養我的組織與思考能力，而生物更讓我深入瞭解人體的奧秘。'
      '與此同時，我對資訊科技充滿好奇心，擁有實踐力。喜歡不斷探索科技的發展，並在實際應用中挑戰自己。除了學術上的追求，我還對生物、社會和科學有著濃厚的興趣，深信這些領域的知識能夠豐富我的人生視野。同時，喜好健身的我將健康視為生活的重要一環，努力保持良好的身體狀態。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 标题
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '自我介紹',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                s1,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 放一张照片（使用圆形剪裁）
          ClipOval(
            child: Container(
              color: Colors.white, // 新的颜色
              child: Image.asset(
                'images/1.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          // 图片展示（使用圆形剪裁和灵活布局）,
        ],
      ),
    );
  }

  // 辅助方法：构建圆形图片
  Widget _buildCircularImage(String imagePath) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.deepOrange), // 新的颜色
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '學習歷程',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '義興國小',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '在義興國小的學習歲月中，我培養了基本的學習與人際關係能力。參與了學校的各項活動，激發了對知識的好奇心。',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '中壢國中',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '就讀中壢國中之後，我擔任班級幹部，培養了領導才能和協作精神。學業上也更加注重，培養了解題思維。',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '新興高中',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '在新興高中的階段，我選擇了更多的科目，包括理工科和人文科，擴展了自己的知識面。積極參與學校的社團，提升了自己的藝術和運動方面的能力。',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '高科大',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '進入高科大後，我專業方向選擇了資訊工程。在這裡，我深入學習了計算機科學和軟體工程相關的知識，參與了多個項目，培養了解難題和團隊協作的能力。',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLearningPhase('大一階段', [
              '開始充滿挑戰與樂趣的半工半讀生活。',
              '拓展社交圈，豐富大學生活。',
            ]),
            SizedBox(height: 20),
            _buildLearningPhase('大二階段', [
              '著重於提升專業技能，拓展知識領域。',
              '努力維持良好的學業成績，穩步前進。',
            ]),
            SizedBox(height: 20),
            _buildLearningPhase('大三階段', [
              '成功達到多益測驗550分的里程碑。',
              '全力投入實務專題，實現理論與實踐的結合。',
            ]),
            SizedBox(height: 20),
            _buildLearningPhase('大四階段', [
              '積極參與校外實習，獲得寶貴的工作經驗。',
              '開始接觸實際案件，應用所學解決實際問題。',
              '深思熟慮，考慮攻讀研究所的可能性。',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningPhase(String term, List<String> achievements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          term,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10), // 內部間距
          margin: EdgeInsets.all(10), // 外部間距
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // 圓角邊框
            color: Colors.deepOrange, // 背景顏色
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: achievements
                .map(
                  (achievement) => Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          color: Colors.lightBlueAccent,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            achievement,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '專業方向',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20),
          _buildSpecializationItem('Web應用開發',
              '在Web前端開發領域有豐富經驗，精通HTML、CSS、JavaScript等技術，關注並實踐最佳用戶體驗設計。'),
          _buildSpecializationItem('資料庫管理', '具備卓越的資料庫管理和SQL語言的能力。'),
        ],
      ),
    );
  }

  Widget _buildSpecializationItem(String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepOrange,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
