//  1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
// ошибка 400,
// ошибка 404,
// ошибка 500.


// создаем перечисление
print("Задание - 1")
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

print("********\n\n")


//-------------------------

// 2. Добавьте проверку переменных в генерирующую функцию и обработайте её
print("Задание - 2")

print("*********\n\n")




//-----------------

// 3. Напишите функцию, которая будет принимать на вход два разных типа и проверять:
// если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае
// — “No”.


print("Задание - 3")

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

print("Структура \(s1) и \(s2) одного типа? - \(compareType(firstValue: s1, secondValue: s2))")
print("Два экземпляра одного класса \(c1)  \(c2) одного типа? - " + compareType(firstValue: c1, secondValue: c2))
print("Структура \(s2)  и экземпляр класса \(c1) одного типа? - " + compareType(firstValue: s2, secondValue: c1))


print("********\n\n")

//-------------------------------------

//4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение.
// Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые.

print("Задание - 4")

enum Exeption10:Error{
    case matchingType
    case somthingElse
}

func compareTypeEx<T1,T2>(fVal:T1,sVal:T2)  throws {
    if type(of:T1.self) == type(of: T2.self) {throw Exeption10.matchingType }
    else {throw Exeption10.somthingElse}
}

    
    
do {
    try compareTypeEx(fVal: 33, sVal: "Сравним тёплое с колючим :)")
} catch Exeption10.matchingType{
    print("Matching Types")
} catch Exeption10.somthingElse{
    print("Somthing Else")
}

do {
    try compareTypeEx(fVal: 56099040, sVal: 556537895)
} catch Exeption10.matchingType{
    print("Matching Types")
} catch Exeption10.somthingElse{
    print("Somthing Else")
}

print("*********\n\n")

print("Задание - 5")


func compareValue<T:Equatable>(fstValue:T, scdValue:T) -> String {
    if fstValue == scdValue {return "Equal"}
    else {return "Not equal"}
}

print(compareValue(fstValue: 44, scdValue: 31))
print(compareValue(fstValue: 200, scdValue: 200.0))
print(compareValue(fstValue: "YES", scdValue: "YES"))
print(compareValue(fstValue: "NO", scdValue: "No"))

struct S2000:Equatable{
    var X:Int
    var Y:Int
    var Z:Int
}
let s10=S2000(X:25,Y:44,Z:70)
let s20=S2000(X:25,Y:44,Z:70)
let s30=S2000(X:10,Y:50,Z:30)

print(compareValue(fstValue: s10, scdValue: s20))
print(compareValue(fstValue: s20, scdValue: s30))


print("********\n\n")





