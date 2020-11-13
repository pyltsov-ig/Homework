//Создайте кортеж для двух человек с одинаковыми типами данных и параметрами.
//При том одни значения доставайте по индексу, а другие — по параметру.
//Пример (для демонстрации задачи, чтобы было понимание, что надо делать):

let firstMan    = (firstName:"Roger",lastName:"Glover",age:45)
let secondMan   = (firstMan:"David",lastName:"Gilmour",age:51)

// достаем по индексу
firstMan.0
firstMan.1
firstMan.2

// достаем по имени параметра
secondMan.firstMan
secondMan.lastName
secondMan.age

//Создайте массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце). Используя цикл for и этот массив:
//выведите количество дней в каждом месяце
//используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
//сделайте тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней)
//сделайте тоже самое, только выводите дни в обратном порядке (порядок в исходном массиве не меняется)
//для произвольно выбранной даты (месяц и день) посчитайте количество дней до конца года


// печатаем в консоль дни
print("\n\n***** печатаем в консоль дни ********** \n")

let daysByMonth:[Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
for days in daysByMonth{
    print(days)
}

// печатаем в консоль месяцы и дни
print("\n\n***** печатаем в консоль месяцы и дни  ********** \n")

let namesOfMonths:[String]=["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"]

var monthAndDays:Array<(nameOfMonth:String,daysInMonth:Int)>=[] // это массив кортежей для следующего задания
for index in 0..<namesOfMonths.endIndex{
    print("\(namesOfMonths[index]) - \(daysByMonth[index]) дня(дней)")
    monthAndDays.append((namesOfMonths[index],daysByMonth[index])) //заодно заполняем массив кортежей для следующего задания
}

// печатаем в консоль месяцы и дни c использованием массива кортежей
print("\n\n***** печатаем в консоль месяцы и дни c использованием массива кортежей ********** \n")

for index in 0..<monthAndDays.count{
    print("\(monthAndDays[index].nameOfMonth)   - \(monthAndDays[index].daysInMonth) дня(дней)")
}
// или так без for in с использованием метода map
print("\n\n***** или так, без for in, с использованием метода map ********** \n")
monthAndDays.map({print("\($0)")})


// печатаем в консоль месяцы и дни в обратом порядке с циклом for in
print("\n\n***** печатаем в консоль месяцы и дни в обратом порядке с циклом for in ********** \n")

for index in stride(from: (monthAndDays.endIndex)-1, to: monthAndDays.startIndex-1, by: -1) {
    print(monthAndDays[index])
}

// печатаем в консоль месяцы и дни в обратом порядке с циклом while
print("\n\n***** печатаем в консоль месяцы и дни в обратом порядке с циклом while ********** \n")


var idx = monthAndDays.endIndex-1
while idx >= 0 {
    print(monthAndDays[idx])
    idx-=1
    
}


print("\n\n****** вычисляем количество дней до конца года **********************\n")


let day             = 31
let month           = "Октябрь"
var daysFromYear    = 0

for index in 0..<monthAndDays.endIndex{
    if monthAndDays[index].nameOfMonth != month {
        daysFromYear+=monthAndDays[index].daysInMonth
    } else {
        daysFromYear+=day
        print(" Сегодня \(day) \(month), до конца года осталось \(daysByMonth.reduce(0, +) - daysFromYear) дня(дней)")
        break
    }
}

//Создайте словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.
//Повысьте студенту оценку за экзамен
//Если оценка положительная (4 или 5) или удовлетворительная (3), то выведите сообщение с поздравлением, отрицательная (1, 2) - отправьте на пересдачу
//Добавьте еще несколько студентов — это ваши новые одногруппники!
//Удалите одного студента — он отчислен
//Посчитайте средний балл всей группы по итогам экзамена.

print("\n\n****** Создаем словарь студентов с отметками \n")
var students:[String:Double] = ["David Gilmour":5,"Ian Paice":3,"David Coverdale":4,"Roger Glover":2,"Ian Gillan":3,"Glenn Hughes":2]
print(students)

print("\n\n****** Повышаем оценку студенту Roger Glover \n")

students.updateValue(4, forKey: "Roger Glover")
print(students)


print("\n\n****** Печатаем результаты экзамена \n")


for (name, grade) in students{
    if grade < 3 {
        print("Судент \(name) экзамен не сдал. На пересдачу!")
    } else{
        print("\(name) поздравляем, экзамен сдан! Оценка - \(grade)")
    }
}

print("\n\n****** Добавляем студентов \n")

students["John Lord"] = 5
students["Dan McCafferty"] = 4
print(students)

print("\n\n****** Удаляем студента \n")

students.removeValue(forKey: "Glenn Hughes")

print(students)

print("\n\n*************** вычисляем средний бал ******************\n")

let grades = [Double](students.values)
print("Средний бал - \(grades.reduce(0, +)/Double(grades.endIndex))")




