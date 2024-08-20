### Component

- 전역적으로 사용하는 위젯이다.
- 위젯으로 판별하는 기준은 stateless, stateful widget을 썼는가에 따라 갈린다
- 만약 위 2개를 사용하지 않았다면 Core로 이동한다.

### Init

- 이곳에서도 전역적으로 사용하는 변수나 함수가 들어간다.
- Init으로 판별하는 기준은 프로그램이 시작할 때 main함수에서 호출이 필요하다면 이곳 Init함수로 오게 된다.

### Core

- 전역적으로 사용하는 변수와 함수이다.
- 컴포넌트에 들어가지 않은 다른 종류의 것들을 넣는다.

### Di

- 의존성 주입이다.
- 쉽게 표현해서 Data, Domain, Presentation에서 직접 값을 넣지 않고 파라미터로 명시해둔 값을 이곳에서 넣어준다.
- 이렇게 한다면 Presentation에서 쓸데없는 Data딴에 있는 의존성을 직접 받지 않게 된다.

### Data

- DB와 통신하는 로직을 집합시킨 곳이다.
- 내부 구조는 API 명세에 따른 폴더 이름과 그 내부에 dto, data_source, repository로 나뉨
- **Data_Source :**
  - **DB와 통신하는 로직이 들어가 있음, Remote Local로 나뉜다.**
  - **Remote** : 서버와 통신할 때
  - Local : Local DB와 통신할 때
- **Dto :**
  - **DB와 통신할 때의 로직이 들어가 있는 Model이라고 생각하면 편하다, Response, Request로 나뉨**
  - Response : DB에서 값을 받아올 때의 로직이 들어가 있는 Model (흔히 쓴다)
    - Entity와 나누어서 Data와 Domain딴에서 사용하는 Model을 나누기 위해 사용한다.
  - Request : DB에서 값을 받아오기전 보내줄 값을 명시해 놓은 Model (보내줄 값이 3개 이상일때 사용)
    - 여기서 Request에서 3개 이상 사용하는 이유는 그 이전에 만드는 것으로 해두면 수많은 Request를 생성하고 파일을 찾기 힘들어져 가독성을 해친다고 생각했기 떄문이다.
    - Request는 Response와 다르게 Entity로 나누는 작업을 하지 않고 오로지 Request만 사용한다.
- **Repository :**
  - **여기에 Repository에선 Domain에서 설정해둔 repository 파일을 implements한 것이다., DataSource와 통신하는 역할을 가진다.**

### Domain

- UseCase를 명시하고 Entity를 정의하는 로직이 집합된 곳이다.
- 내부 구조는 API 명세에 따른 폴더 이름과 그 내부에 entity, repository, use_case로 나뉜다.
- **Repository** :
  - Data에 있는 Repository와 통신하기 위한 매개체로 UseCase에서 Data에 있는 Repository를 직접 의존하지 않고 한번 거쳐서 의존하기 위한 추상 클래스이다.
- **Entity** :
  - Dto처럼 DB와 통신하기 위한 로직이 들어가 있는 Model이 아닌 그 어떤 로직도 들어가 있지 않고 오로지 받는 값만을 명시한 Model이다.
- **UseCase :**
  - Repository를 의존하고 repository안에 있는 각 함수를 따로 명시해둔 Class이다.
  - 이것은 ViewModel에서 사용하며 오로지 한가지의 함수를 명시하기 때문에 ViewModel에서 접촉할때 많은 의존성을 참고하지 않고 한가지의 함수만 의존성을 가지기 때문에 의존성 분리에 좋다.

### Presentation

- 화면을 표현하기 위한 로직이 집합된 곳이다.
- 내부 구조는 화면을 기준으로 한 폴더와 그 내부에 ui와 view_model이 있다.
- 화면을 기준으로 한다는 것은 디자인을 기반으로 하며 같은 view_model을 공유한다면 화면 단위가 아닌 다른 단위로 묶일 수 있다.
- **Ui :**
  - view : ui내부에는 view가 있는데 이는 한 화면을 구성하는 위젯일 때 이 폴더에 들어간다
  - widget : ui내부에는 widget이 있는데 이는 한 화면 내에 위젯으로 존재한다면 이 폴더에 들어간다.
    - widget 내에는 container와 container_widget으로 나뉠 “때”도 있는데
    - 여기서 Container는 Home에 위젯같이 들어가는 친구지만 home/widget으로 위치를 빼기에는
    - view_model의 의존성이 여러 위치로 흩어지는 문제가 있어 따로 Container로 위치한다.
    - 또한 container_widget은 container내에서 사용하는 widget들이다.
- **ViewModel :**
  - View를 구성하기 위해 내부 변수를 저장하는 곳으로 View의 상태를 여기에 있는 변수를 바꿈으로써 화면을 바꿀 수 있다.