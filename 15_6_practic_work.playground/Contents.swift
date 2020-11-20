//  1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
// ошибка 400,
// ошибка 404,
// ошибка 500.


// создаем перечисление
enum ServerError:Error{
    case badRequest             // ошибка 400
    case pageNotFound           // ошибка 404
    case internalServerError    // ошибка 500
}

// переменная для хранения кода ошибки
var errorCode = 500


// генерирующая функция
func serverRequest() throws {
    if errorCode == 400 {throw ServerError.badRequest}
    if errorCode == 404 {throw ServerError.pageNotFound}
    if errorCode == 500 {throw ServerError.internalServerError}
}

// обработка ошибки
do {
    try serverRequest()
}catch ServerError.badRequest{
    print("Неправильный запрос. Сервер не может обработать ваш запрос.")
}catch ServerError.pageNotFound{
    print("запрашиваемая страница не найдена.")
}catch ServerError.internalServerError{
    print("Сервер не может выполнить ваш запрос в настоящее время. Попробуйте позже.")
}

//-------------------------

// 2. Добавьте проверку переменных в генерирующую функцию и обработайте её

//-----------------

// 3. Напишите функцию, которая будет принимать на вход два разных типа и проверять:
// если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае
// — “No”.

//



func compareType<T1,T2>(firstValue:T1, secondValue:T2) -> String {
    if type(of:T1.self) == type(of: T2.self) {return "Yes"}
        else {return "No"}
}

print("44 и 31 одинакового типа? - "+compareType(firstValue: 44, secondValue: 31))
print("200 и 200.0 одинакового типа? - "+compareType(firstValue: 200, secondValue: 200.0))
print("YES и NO одинакового типа? - "+compareType(firstValue: "YES", secondValue: "NO"))
print("78 и массив [1,2,3] одинакового типа? - "+compareType(firstValue: 78, secondValue: [1,2,3]))

struct S1000{
    var X:Int
    var Y:Int
    var Z:Int
}

class C1000 {
    var alfa:Int
    var beta:Float
    init(){
        self.alfa=40
        self.beta=3.12
    }
}

let s1=S1000(X:25,Y:44,Z:70)
let s2=S1000(X:33,Y:51,Z:90)

let c1=C1000()
let c2=C1000()

print("Структура s1 и s2 одного типа? - \(compareType(firstValue: s1, secondValue: s2))")
print("Два экземпляра одного класса одного типа? - " + compareType(firstValue: c1, secondValue: c2))
print("Структура и экземпляр класса одного типа? - " + compareType(firstValue: s2, secondValue: c1))

//












