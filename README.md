# usket.Architectures
MVC, MVVM, MVP, VIPER, RIBs 등 아키텍처에 대해 학습하는 Repository 👏

- 아키텍처
    - 개념
        - 시스템 구성 및 동작 원리를 나타내고 있다.
        - 구성 요소 간의 관계 및 시스템 외부 환경과의 관계가 묘사된다.
        - 즉, 하나의 서비스의 동작원리를 나타낼 수 있는 방법 중에 하나.
    - 그렇다면 좋은 아키텍처란 어떤 것인가
        - 각각의 객체들이 구체적이고 명확한 역할을 가지고 있어야한다.
        - 테스트가 가능해야한다.
        - 사용의 용이성이 높고, 낮은 유지 보수 비용이 발생해야한다.
        - 단순한 데이터 흐름과 쉬운 디버깅
        - 관심사의 분리
    - 아키텍처의 종류
        - MVC
        - MVVM
        - MVP
        - VIPER
        - RIBs
        - Clean Architecture
- MVC
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/13c4bfca-c686-4545-ac07-2bacd2193320/Untitled.png)
    
    - 간단한 프로젝트에 적용할 수 있는 기본적인 아키텍처이며
        - M ( Model ) : 앱이  무엇인지 관심을 가집니다. ( 어떠한 것을 가지고 프로그래밍할 것인가 )
            - 앱이 가지는 데이터를 정의합니다.
            - UI와 독립되어 있습니다.
        - V ( View ) : 사용자에게 보여지는 영역
        - C ( Controller ) : Model과 View 사이의 다리 역할
            - Model과 View는 직접적으로 소통할 수 없으며 Controller가 이를 통제
                - View to Controller : Controller는 View에 대해서 Outlet을 이용해 View에 접근할 수 있다. 이때, View는 Target-Action의 구조로 행위에 따라 특정한 Action을 취할 수 있다. 또한 Delegate를 이용해 행위에 대한 요청을 할 수 있으며, Datasource를 이용해 데이터를 요청할 수 있다.
                - Model to Controller : 컨트롤러는 모델에 접근할 수 있다. 하지만 모델의 경우 Notification & KVO 방식을 통해 모델의 변화를 컨트롤러에게 전달할 수 있다.
                    - Notification & KVO
                        - Notification Center라는 싱글턴 객체를 활용해 이벤트 발생 여부를 Observer를 등록한 객체들에게 Post(전달)하는 방식으로 사용
                        - KVO(Key Value Observing) : 메서드나 특정 액션이 아닌 프로퍼티의 상태가 변함에 따라 반응하는 형식으로 이를 통해 Controller에게 전달
        - MVC Architecture의 장단점
            - 장점 : 접근이 쉬우며 구조파악이 용이
            - 단점 : View와 Model의 완벽한 분리가 어려울 뿐만아니라 앱이 커짐에 따라 Controller의 코드가 비대해지며 유지보수가 어렵다.  또한 테스팅이 어렵다.
        - 결론 : 현대에 사용되어지는 대부분의 대규모 프로젝트에서는 MVC가 사용될 가능성은 극히 적다. 이유는 유지보수, 테스팅 등 지속가능성이 떨어지기 때문이다.
        
        - 간단한 구현
            - User의 정보를 받아 View에 보여주는 간단한 예시
            - Model - 이 모델을 통해 프로그래밍을 할 것
                
                ```swift
                // 유저의 정보를 담게 될 구조체
                struct UserInfo { 
                    
                    let name: String
                    let age: Int
                    
                    init(name: String, age: Int) {
                        self.name = name
                        self.age = age
                    }
                }
                ```
                
            - View
                
                ```swift
                private let titleLabel = UILabel()
                private let userNameInputView = UserInfoInputView(title: "Name")
                private let userAgeInputView = UserInfoInputView(title: "Age")
                private let userInfoLabel = UILabel()
                private let checkButton = CheckButton()
                ```
                
            - Controller
                
                ```swift
                @objc
                private func showUserInfo() {
                    guard let userName = userNameInputView.getUserInfo(), userName != ""  else {
                        showToast(message: "이름을 입력하지 않았어요.")
                        return
                    }
                    guard let userAge = userAgeInputView.getUserInfo(), userAge != "" else {
                        showToast(message: "나이를 입력하지 않았어요.")
                        return
                    }
                    let userInfo = UserInfo(name: userName, age: userAge)
                    userInfoLabel.setCheckUserInformation(userInfo: userInfo)
                }
                ```
                
            
            - 설명
                - Model - UserInfo
                    
                    ![스크린샷 2022-08-09 오후 9.40.01.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1672d55a-c2be-47a5-a628-11b3f4976dee/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-09_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_9.40.01.png)
                    
                - View - UILabel, View, Button
                    
                    ![스크린샷 2022-08-09 오후 9.41.24.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3bb80ea8-d9b6-47cf-863c-c9d96235e99b/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-09_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_9.41.24.png)
                    
                - Controller - Target-Action의 구조로 View와 Controller간의 의사소통
                    
                    ![스크린샷 2022-08-09 오후 9.42.37.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9dd9eb6f-ce52-4ca4-a35d-790c6280f2da/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-09_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_9.42.37.png)
                    
                - 영상
                    
                    [Simulator Screen Recording - iPhone 12 - 2022-08-09 at 21.35.00.mp4](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2d6035a1-7f25-4eb7-accc-9dabfd3cb0cf/Simulator_Screen_Recording_-_iPhone_12_-_2022-08-09_at_21.35.00.mp4)
