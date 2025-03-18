
import Foundation

class CurSession{
    static let curSesh = CurSession()
    var curPIN: String?
}

struct shift{
    let pin: String
    let clockIn: Date
    var clockOut: Date?
    
    var totalTime: TimeInterval{
        if clockOut == nil{
            return clockIn.timeIntervalSince(clockIn)
        }
        return clockOut!.timeIntervalSince(clockIn)
    }
}

var shifts: [shift] = [
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 31, hour: 10, minute: 12, second: 20)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 31, hour: 17, minute: 32, second: 43)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 1, hour: 10, minute: 8, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 1, hour: 19, minute: 21, second: 2)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 2, hour: 9, minute: 57, second: 11)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 2, hour: 15, minute: 21, second: 2)) ?? Date()),

    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 9, hour: 10, minute: 57, second: 21)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 9, hour: 18, minute: 31, second: 54)) ?? Date()),

    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 10, hour: 10, minute: 12, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 10, hour: 19, minute: 1, second: 2)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 11, hour: 10, minute: 0, second: 42)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 11, hour: 17, minute: 32, second: 19)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 18, hour: 10, minute: 6, second: 43)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 18, hour: 17, minute: 30, second: 32)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 27, hour: 10, minute: 0, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 27, hour: 17, minute: 59, second: 12)) ?? Date()),
    
    shift(pin: "1234",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 3, hour: 10, minute: 0, second: 12)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 3, hour: 17, minute: 59, second: 12)) ?? Date()),

    
    
    
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 30, hour: 10, minute: 12, second: 20)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 30, hour: 17, minute: 32, second: 43)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 3, hour: 10, minute: 8, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 3, hour: 19, minute: 21, second: 2)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 4, hour: 9, minute: 57, second: 11)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 4, hour: 15, minute: 21, second: 2)) ?? Date()),

    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 12, hour: 10, minute: 57, second: 21)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 12, hour: 18, minute: 31, second: 54)) ?? Date()),

    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 13, hour: 10, minute: 12, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 13, hour: 19, minute: 1, second: 2)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 14, hour: 10, minute: 0, second: 42)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 14, hour: 17, minute: 32, second: 19)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 19, hour: 10, minute: 6, second: 43)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 19, hour: 17, minute: 30, second: 32)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 28, hour: 10, minute: 0, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 28, hour: 17, minute: 59, second: 12)) ?? Date()),
    
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 4, hour: 10, minute: 0, second: 12)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 4, hour: 17, minute: 59, second: 12)) ?? Date()),
    shift(pin: "9876",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 15, hour: 10, minute: 0, second: 12)) ?? Date()
          , clockOut: nil),

    
    
    
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 29, hour: 10, minute: 12, second: 20)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 29, hour: 17, minute: 32, second: 43)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 5, hour: 10, minute: 8, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 5, hour: 19, minute: 21, second: 2)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 6, hour: 9, minute: 57, second: 11)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 6, hour: 15, minute: 21, second: 2)) ?? Date()),

    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 15, hour: 10, minute: 57, second: 21)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 15, hour: 18, minute: 31, second: 54)) ?? Date()),

    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 16, hour: 10, minute: 12, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 16, hour: 19, minute: 1, second: 2)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 17, hour: 10, minute: 0, second: 42)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 17, hour: 17, minute: 32, second: 19)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 20, hour: 10, minute: 6, second: 43)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 20, hour: 17, minute: 30, second: 32)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 1, hour: 10, minute: 0, second: 31)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 1, hour: 17, minute: 59, second: 12)) ?? Date()),
    
    shift(pin: "0000",
          clockIn: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 5, hour: 10, minute: 0, second: 12)) ?? Date()
          , clockOut: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 5, hour: 17, minute: 59, second: 12)) ?? Date()),


]

