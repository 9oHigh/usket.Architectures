# usket.Architectures
### MVC, MVVM, MVP, VIPER, RIBs 등 아키텍처에 대해 학습하는 Repository 👏

### 아키텍처
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
    - Clean Architectur
    - etc
    
### 1. MVC
<details>
<summary>정리</summary>
<div markdown="1">

![Untitled](https://user-images.githubusercontent.com/53691249/183650626-ca216243-d5aa-4314-a319-441af407fa4e.png)


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

                ![스크린샷 2022-08-09 오후 9 40 01](https://user-images.githubusercontent.com/53691249/183651565-9812f96a-e84d-476f-a604-d9a397345dc5.png)


            - View - UILabel, View, Button

                ![스크린샷 2022-08-09 오후 9 41 24](https://user-images.githubusercontent.com/53691249/183651616-8b73b9ac-34fa-4de8-8cfd-b8b224d4155f.png)

            - Controller - Target-Action의 구조로 View와 Controller간의 의사소통

                ![스크린샷 2022-08-09 오후 9 41 24](https://user-images.githubusercontent.com/53691249/183651616-8b73b9ac-34fa-4de8-8cfd-b8b224d4155f.png)


            - 영상

            ![ezgif com-gif-maker](https://user-images.githubusercontent.com/53691249/183652907-439e0e73-20e0-4be6-ab8d-3c5435eca3ff.gif)
                
</div>
</details>
          
### 2. MVVM

<details>
<summary>정리</summary>
<div markdown="2"> 

![Untitled](https://user-images.githubusercontent.com/53691249/185435480-bfe4a54d-5782-4ace-83dc-0fdaee05bd93.png)

- M ( Model )
    - UI와 독립되어 있습니다.
    - App이 하는 일에 대한 데이터와 로직을 캡슐화
    - Model이 변경되었을 때, ViewModel에게 이를 알린다.

- V ( View )
    - MVC 아키텍처와는 다르게 ViewController 자체를 View로 취급한다.
    - UI와 관련된 모든 로직은 ViewModel에 있으므로 View / ViewController가 비대해 지는 것을 방지 할 수 있다. 다만, 모든 로직이 ViewModel에 있는 만큼 ViewModel이 비대해 질 수 있다.
    - View는 ViewModel을 참조한다.
    - View는 Model을 참조하지 않는다.
    - **View는 발행(Publication)을 구독(Subscribe)하고, 관찰(Observe)한다.**

- VM ( ViewModel )
    - ViewModel을 통해 UI로직과 비즈니스 로직을 분리
    - ViewModel은 Model을 참조한다.
    - **View 없이도 테스트가 가능하다. ( 좋은 아키텍처의 조건 중 하나 - 테스트 가능 여부 )**
    - ViewModel은 View의 Input으로부터 Model을 업데이트
    - ViewModel은 Model이 변경되면 View에 반영한다. 즉, Model의 Output으로부터 View를 업데이트
    - ViewModel은 View에 직접적으로 이야기하지 않는다. 무언가 바뀌었다고 발표(Publish)한다.
    - 모든 UI 컨트롤의 상태를 알려주는 프로퍼티를 포함한다.

- MVVM Architecture의 개념과 장단점
    - UI 로직과 비즈니스 로직을 분리하고, 리액티브한 UI 컨셉과 함께 협력하여 작동하는 아키텍처
    - 장점
        - View와 Model이 서로 전혀 알지 못하기 때문에 독립성을 유지할 수 있다. 때문에 Unit Test(하나의 메서드의 특정 루틴을 테스트하는 행위)가 가능하다.
        - View와 ViewModel의 관계는 N:1이기 때문에 하나의 ViewModel을 이용해 여러 View를 사용할 수 있다.
    - 단점
        - 간단한 UI에서는 오히려 ViewModel을 설계하는데 어려움이 있을 수 있다.
        - 데이터 바인딩은 필수적이다.
        - 복잡해질 수록 MVC의 ViewController가 비대해지듯이 ViewModel 또한 비대해 질 수 있다.

- 결론 :  유지보수, 테스팅 등 지속가능성이 MVC 보다 월등히 높기 때문에 많은 앱들이 MVVM Architecture 혹은 MVVM CleanArchitecture를 사용하고 있다.

- 간단한 구현
    - [공개적으로 사용 가능한 더미 웹서비스를 활용](http://dummy.restapiexample.com/api/v1/employees)
    - 해당 데이터(Employees)를 받아와 TableView에 표시하는 예시
        - M ( Model ) - [QuickType을 활용한 Model 생성](https://app.quicktype.io/)

            ```swift
            // MARK: - Source
            struct Source: Codable {
                let status: String
                let data: [Datum]
                let message: String
            }

            // MARK: - Datum
            struct Datum: Codable {
                let id: Int
                let employeeName: String
                let employeeSalary, employeeAge: Int
                let profileImage: String

                enum CodingKeys: String, CodingKey {
                    case id
                    case employeeName = "employee_name"
                    case employeeSalary = "employee_salary"
                    case employeeAge = "employee_age"
                    case profileImage = "profile_image"
                }
            }
            ```

        - 참고

            ```swift
            {"status":"success","data":[{"id":1,"employee_name":"Tiger Nixon","employee_salary":320800,"employee_age":61,"profile_image":""},{"id":2,"employee_name":"Garrett Winters","employee_salary":170750,"employee_age":63,"profile_image":""},{"id":3,"employee_name":"Ashton Cox","employee_salary":86000,"employee_age":66,"profile_image":""},{"id":4,"employee_name":"Cedric Kelly","employee_salary":433060,"employee_age":22,"profile_image":""},{"id":5,"employee_name":"Airi Satou","employee_salary":162700,"employee_age":33,"profile_image":""},{"id":6,"employee_name":"Brielle Williamson","employee_salary":372000,"employee_age":61,"profile_image":""},{"id":7,"employee_name":"Herrod Chandler","employee_salary":137500,"employee_age":59,"profile_image":""},{"id":8,"employee_name":"Rhona Davidson","employee_salary":327900,"employee_age":55,"profile_image":""},{"id":9,"employee_name":"Colleen Hurst","employee_salary":205500,"employee_age":39,"profile_image":""},{"id":10,"employee_name":"Sonya Frost","employee_salary":103600,"employee_age":23,"profile_image":""},{"id":11,"employee_name":"Jena Gaines","employee_salary":90560,"employee_age":30,"profile_image":""},{"id":12,"employee_name":"Quinn Flynn","employee_salary":342000,"employee_age":22,"profile_image":""},{"id":13,"employee_name":"Charde Marshall","employee_salary":470600,"employee_age":36,"profile_image":""},{"id":14,"employee_name":"Haley Kennedy","employee_salary":313500,"employee_age":43,"profile_image":""},{"id":15,"employee_name":"Tatyana Fitzpatrick","employee_salary":385750,"employee_age":19,"profile_image":""},{"id":16,"employee_name":"Michael Silva","employee_salary":198500,"employee_age":66,"profile_image":""},{"id":17,"employee_name":"Paul Byrd","employee_salary":725000,"employee_age":64,"profile_image":""},{"id":18,"employee_name":"Gloria Little","employee_salary":237500,"employee_age":59,"profile_image":""},{"id":19,"employee_name":"Bradley Greer","employee_salary":132000,"employee_age":41,"profile_image":""},{"id":20,"employee_name":"Dai Rios","employee_salary":217500,"employee_age":35,"profile_image":""},{"id":21,"employee_name":"Jenette Caldwell","employee_salary":345000,"employee_age":30,"profile_image":""},{"id":22,"employee_name":"Yuri Berry","employee_salary":675000,"employee_age":40,"profile_image":""},{"id":23,"employee_name":"Caesar Vance","employee_salary":106450,"employee_age":21,"profile_image":""},{"id":24,"employee_name":"Doris Wilder","employee_salary":85600,"employee_age":23,"profile_image":""}],"message":"Successfully! All records has been fetched."}
            ```


        - V ( View / ViewController )

            ![스크린샷 2022-08-19 오전 12 24 17](https://user-images.githubusercontent.com/53691249/185435491-04a9a052-490e-4856-b2f4-363adcd5796c.png)

            - button 클릭시 employee의 정보를 화면에 보여주기 위한 tableView 및 button

        - VM ( ViewModel )
            - Input & Output 방식을 사용하기 위한 프로토콜

                ```swift
                protocol ViewModelType {
                    associatedtype Input
                    associatedtype Output

                    var input: Input { get }
                    var output: Output { get }
                }
                ```

            - ViewModel

                ```swift
                final class EmployeesViewModel: ViewModelType {

                    struct Input {
                        let loadTrigger = PublishSubject<Void>()
                    }

                    struct Output {
                        let employeesList = BehaviorSubject<[Datum]>(value: [])
                    }

                    var input: Input
                    var output: Output

                    private let apiService: APIService
                    private let disposeBag = DisposeBag()

                    init(input: Input = Input(), output: Output = Output(), apiService: APIService = APIService()) {
                        self.input = input
                        self.output = output
                        self.apiService = apiService

                        self.input.loadTrigger
                            .bind { [weak self] _ in
                                self?.apiService.requestEmployees { [weak self] source in
                                    self?.output.employeesList.onNext(source.data)
                                }
                            }
                            .disposed(by: disposeBag)
                    }
                }
                ```

                - 설명
                    - APIService로부터 받아온 데이터를 통해 loadTrigger(button-Click)에 bind 하기
            - 영상

                ![ezgif com-gif-maker](https://user-images.githubusercontent.com/53691249/185436782-14fc7953-1a8f-4930-b463-d186a189024b.gif)
</div>
</details>

