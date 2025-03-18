
import UIKit

class AdminOnlyViewController: UIViewController, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource {
    

    var employees = ["1234", "9876"]
    var selectedEmployee: String?
    var secEmpSessions: [shift] = []
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    
    @IBOutlet weak var endDate: UIDatePicker!
    
    
    @IBOutlet weak var viewRecord: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        selectedEmployee = employees[0]
        

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return employees.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Employee \(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedEmployee = employees[row]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secEmpSessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminRecordCell", for: indexPath)
        
        let curSesh = secEmpSessions[indexPath.row]
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM d, yyyy"
        
        let date = dateFormat.string(from: curSesh.clockIn)
        
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "h:mm a"
        
        let clockInTime = timeFormat.string(from: curSesh.clockIn)
        
        let clockOutTime: String
        if(curSesh.clockOut == nil){
            
             clockOutTime = "CURRENTLY CLOCKED IN"

        }
        else{
             clockOutTime = timeFormat.string(from: curSesh.clockOut!)
            
        }
        
        let hrs = (Int(curSesh.totalTime))/3600
        let mins = (Int(curSesh.totalTime)%3600)/60
        
        let totalTime = String(format: "%02d:%02d", hrs, mins)

        
        cell.textLabel?.text = " Date: \(date) | Clock In: \(clockInTime) | Clock Out: \(clockOutTime) | Total Time: \(totalTime)"
        return cell

    }

    
    @IBAction func recordButton(_ sender: Any) {
        let startDateTime = startDate.date
        let endDateTime = endDate.date
        
        secEmpSessions = shifts.filter{shift in shift.clockIn >= startDateTime && (shift.clockOut == nil||shift.clockOut! <= endDateTime) && shift.pin == selectedEmployee  }
        
        tableView.reloadData()
        
        debugPrint(!secEmpSessions.isEmpty)
    }
    
    


}
