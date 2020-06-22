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