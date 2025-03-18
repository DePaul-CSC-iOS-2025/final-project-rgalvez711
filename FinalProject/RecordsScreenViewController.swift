
import UIKit

class RecordsScreenViewController: UITableViewController {

    var curEmpSessions: [shift] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        curEmpSessions = shifts.filter{$0.pin == CurSession.curSesh.curPIN}
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        curEmpSessions = shifts.filter{$0.pin == CurSession.curSesh.curPIN}
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curEmpSessions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        
        let curSesh = curEmpSessions[indexPath.row]
        
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
    
    


}
