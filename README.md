
## MVVM
`MVVM`은 `Model-View-ViewModel`의 약자로, 총 3가지의 그룹으로 이루어진
패턴이다. `ViewModel`은 Model의 데이터를 가공해주고
이런 `ViewModel`을 `View`가 보여주는 역할을 한다.

기존에 사용하던 `MVC패턴`에서 `ViewController`의 작업이 방대해지면서,
`View`와 `Model`을 분리해 코드의 양도 줄고 더 효율적인 방식으로 진행된다.
하지만, 데이터 `binding` 작업을 해야하며 단순하고 직관적인 `MVC`와 달리
`ViewModel`의 설계가 쉽지않다.


#### `MVVM` vs `MVC`
![image](https://user-images.githubusercontent.com/100763528/220566324-e92167d3-0660-4a43-8e54-b90603bc5e8a.png)
