Swift Style Code


- https://google.github.io/swift/#function-declarations

* Пример стиля написания кода: 
    public  static func makeLabel(
        text: String? = nil,
        fontSize: CGFloat,
        weight: UIFont.Weight,
        textColor: UIColor? = nil,
        textAlignment: NSTextAlignment? = nil,
        numberOfLines: Int? = nil,
        backgroundColor: UIColor? = nil,
        clipsToBounds: Bool? = nil,
        cornerRadius: CGFloat? = nil
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment ?? .natural
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight )
        label.numberOfLines = numberOfLines ?? 0
        label.backgroundColor = backgroundColor
        label.clipsToBounds = clipsToBounds ?? false
        label.layer.cornerRadius = cornerRadius ?? 0
        return label
    }

- отступы после запятой
Пример: 
(width: 10, height: 20)

- при явном объявлении var или let ->  let number: Int = 5

* функции до 20 строк в идеале 15 ( одна функция - одно действие ) 

*  макс кол-во принимаемых параметров функцией(методом) - не больше 5 

* Больше трех блоков  if  используется switch 

* Вместо дублирования кода: 
1. переиспользуемая функция
2. дженерики 
3. классы / структуры 

* Разгружать от большого кол-ва кода  основной ViewController в uikit и ContentView в SwiftUI так же не нагружать кодом и другие классы/структуру 
