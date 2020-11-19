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











