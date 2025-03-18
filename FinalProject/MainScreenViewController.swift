
import UIKit

class MainScreenViewController: UIViewController {
    var pin = CurSession.curSesh.curPIN
    var curEmpSessions: [shift] = []
    var curShift: shift?
    var timer: Timer?
    var curTime: Date?
    
    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var clockIn: UIButton!
    
    @IBOutlet weak var clockOut: UIButton!
    
    @IBOutlet weak var logOut: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        curEmpSessions = shifts.filter{$0.pin == CurSession.curSesh.curPIN}
        if let lastIndex = curEmpSessions.indices.last {
            if curEmpSessions[lastIndex].clockOut == nil {
                
                curShift = curEmpSessions[lastIndex]
                curTime = curShift!.clockIn
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
                    let timeInSeconds = Int(Date().timeIntervalSince(self.curTime!))
                    let hrs = timeInSeconds/3600
                    let mins = (timeInSeconds%3600)/60
                    let secs = timeInSeconds%60
                    let labelTimer = String(format: "%02d:%02d:%02d", hrs, mins, secs)
                    self.clockLabel.text = String(labelTimer)
                    
                }
            }
            
        }
    }
    
    @IBAction func clockInTap(_ sender: Any) {
        
        if let lastIndex = curEmpSessions.indices.last {
            if curEmpSessions[lastIndex].clockOut == nil {
                
                let alertController = UIAlertController(title: "Error", message: "You already clocked in!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                present(alertController, animated: true, completion: nil)
                return

                
            }
        }

        
        
        
        
        curTime = Date()
        curShift = shift(pin: CurSession.curSesh.curPIN!, clockIn: curTime!, clockOut: nil)
        curEmpSessions.append(curShift!)
        shifts.append(curShift!)
        

        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
            
            let timeInSeconds = Int(Date().timeIntervalSince(self.curTime!))
            
            let hrs = timeInSeconds/3600
            let mins = (timeInSeconds%3600)/60
            let secs = timeInSeconds%60
            let labelTimer = String(format: "%02d:%02d:%02d", hrs, mins, secs)
            
            self.clockLabel.text = String(labelTimer)
        }
        
        let alertController = UIAlertController(title: "Clock In", message: "You have clocked in! Have a nice shift!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true, completion: nil)
        debugPrint(curEmpSessions)
    }
    
    
    
    @IBAction func clockOutTap(_ sender: Any) {
        if let lastIndex = curEmpSessions.indices.last {
            let clockOutComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
            
            curEmpSessions[lastIndex].clockOut = Calendar.current.date(from: clockOutComponents) ?? Date()
            
            var index = 0
            for shift in shifts{
                if shift.clockIn == curEmpSessions[lastIndex].clockIn && shift.clockOut == nil{
                    shifts[index].clockOut = curEmpSessions[lastIndex].clockOut
                    
                }
                index += 1
            }
            debugPrint( curEmpSessions[lastIndex])
        }

        timer?.invalidate()
        timer = nil
        
        self.clockLabel.text = "00:00:00"
        
        
        
        let alertController = UIAlertController(title: "Clock Out", message: "You have clocked out!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true, completion: nil)


    }
    
    
    
    
    
    
    @IBAction func logOutPress(_ sender: Any) {
        
        CurSession.curSesh.curPIN = ""
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
