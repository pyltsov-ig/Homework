// Модуль 9. Итоговый проект.

//***** автопилот *****

var autopilot:Bool  = false // автопилот включен/выключен

//***** характеристики автомобиля *******
let carWeight       = 2108  // масса
let carLength       = 4967  // длина
let carWidth        = 1963  // ширина с учетом зеркал
let carWheelbase    = 2959  // колесная база
let carClearance    = 154.9 // клиренс
let carTrunk        = 900   // объем багажника


//***** функционал автомобиля *******
// ** управление музыкой **

var radioVolLevel    = 0        // уровень громкости от 0 до 10
var radioStFreq      = 100.0    // частота приема радиостанции в MHz
var sunroofPosition  = 0        // положение люка от 0 до 100, где 0 полностью закрыт, а 100 полностью закрыт
var climFunSpeed     = 0        // скорость обдува вентилятора
var climAutoMode     = true     // автоматический климат-контроль включен/выключен
var climTempSet      = 22       // установленная температура
var climTempInCabine = 20       // температура в салоне (измеренная)
var airCondition     = "ВыКЛЮЧЕН"    // информация о состоянии кондиционера

func changeVolLevel(newLevel:Int) -> String{
    switch newLevel {
    case newLevel where (newLevel<=0):
        radioVolLevel = 0
        return "Установлен минимальный уровень громкости "
    case newLevel where (newLevel>=10):
        radioVolLevel = 10
        return "Установлен максимальный уровень громкости"
    default:
        radioVolLevel=newLevel
        return "Установлен уровень громкости \(radioVolLevel)"
    }
}

print(changeVolLevel(newLevel: 4))

func changeSuroofPosition(newPositon:Int) -> String{
    switch newPositon{
    case newPositon where (newPositon==sunroofPosition):
            // ничего не делаем
            return "Ничего не делаем"
    case newPositon where (newPositon<=0):
            //закрываем люк
            //....
            //....
            return "Люк закрыт"
    case newPositon where (newPositon>=100):
            //открываем люк
            //....
            //....
            return "Люк открыт полностью"
    case 1...100:
            sunroofPosition=newPositon
            //передвигам люк на новую позицию
            //...
            //...
            return "Люк открыт на \(sunroofPosition)%"
    default:
        return "Сюда никогда не попадаем. Можно возвращать все что угодно...."
    }
}

sunroofPosition=50
print(changeSuroofPosition(newPositon: -80))

func climControl(temp:Int, funSpeed:Int) -> String{
    if climAutoMode{
        //устанавлием скорость вращения вентилятора автоматически
        //
        climTempSet=temp
        var delta = climTempSet-climTempInCabine
        if delta<0 {
            delta = delta*(-1)
            airCondition = "ВКЛЮЧЕН"
        }
        climFunSpeed=Int(Double(delta)*1.20*1.62)
        if climFunSpeed>10{
            climFunSpeed=10
        } else
        if climFunSpeed<1{
            climTempSet>1
        }
        return "Скорость вращения вентилятора установлена \(climFunSpeed) , кондиционер  \(airCondition)"
    } else {
        // устанавливаем скорость вращения вентилятора
        climFunSpeed = funSpeed
        return "Скорость вращения вентилятора установлена \(climFunSpeed) , кондиционер  \(airCondition)"
    }
}

print("\(climTempInCabine)")
print(climControl(temp: 16, funSpeed: 3))

//******** система обработки ошибок *******
//  в данном случае мы предполагаем, что случилась только одна ошибка.
// если произойдет сразу две, то сработает первая
enum AutoError:Error{
    case isLost         // мы заблудились
    case lowBattery     // низкий уровень заряда батареи
}

var isLost:Bool     = false
var lowBattery:Bool = true

do {
    if isLost{
        throw AutoError.isLost
    }
    
    if lowBattery{
        throw AutoError.lowBattery
    }
}catch AutoError.isLost{
    print("Вы заблудились. Включаю GPS")
}catch AutoError.lowBattery{
    print("Батарея сильно разряжена. Ближайшая станция зарядки через 5 км 600 метров.")
}

//****** включение автопилота *****

func autoPilotOnOff() -> String{
    if autopilot==true{
        autopilot=false
        return "ВНИМАНИЕ! Автопилот отключен. Возьмите управление на себя."
    }else{
        autopilot = true
        return "ВНИМАНИЕ. Включен автопилот. Автомобиль управляется в автоматическом режиме. Продолжайте следить за ситуацией на дороге!"
    }
    
}

autopilot=true
print(autoPilotOnOff())
