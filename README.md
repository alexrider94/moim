# study

flutter 공부를 위한 프로젝트

Flutter 공식사이트 듀토리얼 참고

## Getting Started

# Step 1: Diagram the layout
1. rows 와 columns를 명확히 하기.
2. layout에 grid가 포함되는지?
3. overlapping되는 요소가 있는지?
4. UI가 tabs가 필요한지?
5. alignment, padding, border가 필요한지?

개발하기 앞서서 개발할려는 배치도 아이디어를 생각하고 bottom-up으로 레이아웃을 설정하면서 개발한다.

# 리팩토링
- 한 화면에 여러 기능을 하는 위젯이 여러개 있을경우 한 위젯만으로 관리가 힘들어서 위젯의 영역을 분리한다.
분리하는 방법에 있어서는 안티패턴을 조심!
Stateless위젯은 인스턴스를 매번 만들게 되니 const Stateless를 잘 활용하고 메소드를 위젯을 분리하지 않도록 한다.  

- Provider 패턴 : 관심사의 분리, 클래스가 하나의 역할만

- Bloc 패턴 : UI와 데이터 처리 로직을 분리하는 방식

# 개념
Widget - statelessWidget, statefulWidget
layout - Column, Row
ItemBuilder - listView에 row가 추가될때 마다 호출되는 콜백
~/ - 나눗셈인데 ~추가로 정수형 반환


# library
- 설명
    1. equatable library - dart에서는 ==의 작동방식이 다른데 클래스 비교시 false가 나올 수 있는 경우를 ==와 hasCode를 오버라이드해서 사용한다. 
    2. google_sign_in
    3. http
    4. firebase_auth: Firebase의 인증 기능을 제공하는 플로그인
    5. provider: 여러 페이지에서 인증 정보를 공유하기 위해 사용할 Provider 기능을 제공하는 플러그인
    6. shared_preferences: 사용자의 메일주소와 비밀번호를 저장하기 위해 사용할 플러그인
    7. logger: 로그을 출력하기 위한 플러그인(옵션)
    8. firebase_storage: Firebase에 서버 저장소, 이미지 서로 왓다갓다 업로드,다운로드
    9. fluttertoast - toast메세지 띄우기
    10. shared_preferences - 로컬 캐시 데이터 저장
    11. image_picker - 이미지 가져오거나 새로 이미지 찍는거
    12. intl - 다국어

# container
1. child - 한개의 위젯, Center, Container
2. children - 여러개의 위젯, Row, Column, ListView, Stack

# flutter database
1. SQlite
2. Firebase ✅
- 6가지 기능
    1. Authentication
    2. Database(Cloud Firestore)
    3. Storage
    4. Hosting
    5. Functions
    6. ML kit 

# Widget

1. MaterialApp / Material - Material design의 기본골격을 쉽게 추가할 수 있는 위젯 <-> CapertinoApp
2. Scaffold - Material design 구조를 잡아주는 뼈대
2. Container - 
3. StatefulWidget - 위젯의 생명주기동안 값이 변할 수 있는 위젯, 반드시 State인스턴스를 생성하는 StatefulWidget클래스를 생성해야함.

# github 파일삭제후 폴더관리
git rm --cached -r .
git add.
git commit -m 'commit message'