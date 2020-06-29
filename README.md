# Moim application For study

flutter 공부를 위한 프로젝트

## 애플리케이션

<div>
<img src="https://user-images.githubusercontent.com/38070150/85966343-6ecb4800-b9fa-11ea-9dad-e17b52b45ccb.png" width="200" height="350"/>
<img src="https://user-images.githubusercontent.com/38070150/85966655-6aebf580-b9fb-11ea-9c89-2f626ab03a2c.png" width="200" height="350"/>
<img src="https://user-images.githubusercontent.com/38070150/85966693-835c1000-b9fb-11ea-8fe0-dc0cfee13c92.png" width="200" height="350"/>
<img src="https://user-images.githubusercontent.com/38070150/85966697-848d3d00-b9fb-11ea-8c95-6fa504eba575.png" width="200" height="350"/>
</div>

## Study Content

### 1. Diagram the layout

1. rows 와 columns를 명확히 하기.
2. layout에 grid가 포함되는지?
3. overlapping되는 요소가 있는지?
4. UI가 tabs가 필요한지?
5. alignment, padding, border가 필요한지?

개발하기 앞서서 개발할려는 배치도 아이디어를 생각하고 bottom-up으로 레이아웃을 설정하면서 개발한다.

### 2. 리팩토링

> Tip - 한 화면에 여러 기능을 하는 위젯이 여러개 있을경우 한 위젯만으로 관리가 힘들어서 위젯의 영역을 분리한다
분리하는 방법에 있어서는 안티패턴을 조심!
Stateless위젯은 인스턴스를 매번 만들게 되니 const Stateless를 잘 활용하고 메소드를 위젯을 분리하지 않도록 한다.
>
> - Provider 패턴 : 관심사의 분리, 클래스가 하나의 역할만
Provider함수는 이전 context에 있던 값을 부모에서 있는 값들을 가져올 수 있다
> - Bloc 패턴 : UI와 데이터 처리 로직을 분리하는 방식

### 개념

> - Widget - statelessWidget, statefulWidget
> - layout - Column, Row
> - ItemBuilder - listView에 row가 추가될때 마다 호출되는 콜백
~/ - 나눗셈인데 ~추가로 정수형 반환
> - async / await - 비동기 함수를 정의하고 그 결과를 선언하는것, HTTP로 통신할때 일반적으로 비동기로 호출함.
비동기는 함수 호출시 블럭이 되지 않고 다 훝고 콜백식으로 완료가 됫을때 다시 결과를 받는 경우
> - Future - 자바스크립트의 Promise와 유사. 미래의 어느 시점에 사용가능한 value를 표현하기 위함.

### library

> 설명

    * equatable library : dart에서는 ==의 작동방식이 다른데 클래스 비교시 false가 나올 수 있는 경우를 ==와 hasCode를 오버라이드해서 사용한다.
    * google_sign_in
    * http
    * firebase_auth: Firebase의 인증 기능을 제공하는 플로그인
    * provider: 여러 페이지에서 인증 정보를 공유하기 위해 사용할 Provider 기능을 제공하는 플러그인
    * shared_preferences: 사용자의 메일주소와 비밀번호를 저장하기 위해 사용할 플러그인
    * logger: 로그을 출력하기 위한 플러그인(옵션)
    * firebase_storage: Firebase에 서버 저장소, 이미지 서로 왓다갓다 업로드,다운로드
    * fluttertoast - toast메세지 띄우기
    * shared_preferences - 로컬 캐시 데이터 저장
    * image_picker - 이미지 가져오거나 새로 이미지 찍는거
    * intl - 다국어

### Widget 내용

> 설명

    1. child - 한개의 위젯, Center, Container
    2. children - 여러개의 위젯, Row, Column, ListView, Stack

### flutter 데이터베이스

> SQlite\
> Firebase ✅

- 6가지 기능
    1. Authentication
    2. Database(Cloud Firestore)
    3. Storage
    4. Hosting
    5. Functions
    6. ML kit 

- documentId 가져오는 방법 - DocumentRefrence df = Firestore.instance.collection(col).add({datas});
- 특정 document 하나 가져오는방법 - document(특정키값).get().then((doc){어떤저장변수값 = doc.data['필드이름']})으로 가져오고
Future< dynamic >안에 저장되는데 이 값을 뽑아내기 위해서 asnyc함수와 await을 이용해서 그 저장된 변수값을 다시 then을 이용해 뽑아낸다.
- 배열형태의 데이터를 추가할떄 배열형식으로 FieldValue.arrayUnion을 이용하여서 추가해줄 수 있음
- 배열내부안에 딕셔너리형태로 where문을 이용해서 값을 가져올려고했는데 최근에는 arrayContains가 인덱스의 값만 가져와서 내부 키값을 가져올수
없는것이라고한다. 그래서 그냥 배열내의 배열이 아닌 배열로만 users로 처리하였다.

### Widget

1. MaterialApp / Material - Material design의 기본골격을 쉽게 추가할 수 있는 위젯 <-> CapertinoApp
2. Scaffold - Material design 구조를 잡아주는 뼈대
3. StatefulWidget - 위젯의 생명주기동안 값이 변할 수 있는 위젯, 반드시 State인스턴스를 생성하는 StatefulWidget클래스를 생성해야함.

### github 파일삭제후 폴더관리

> git rm --cached -r . \
> git add. \
> git commit -m 'commit message'
