
import UIKit

class RootViewController: UITableViewController {
    
    //기사 제목과 기사 링크를 저장할 배열을 생성
    var titles : [String] = [String]()
    var links : [String] = [String]()

    //태그 안의 내용을 일시적으로 저장할 문자열 변수 생성
    //null을 저장할 수 있도록 설정
    var contents : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="한겨례 오늘의 주요기사"
        
        //XML 데이터가 있는 URL
        let url = "http://www.hani.co.kr/rss/lead/"
        //XMLParser 인스턴스 생성
        let xmlParser = XMLParser(contentsOf: URL(string: url)!)
        //파싱을 수행할 인스턴스를 설정
        xmlParser?.delegate = self
        //파싱 시작
        let result = xmlParser?.parse()
        if result == true{
            NSLog("파싱성공")
        }else{
            NSLog("파싱실패")
        }
        
    }

    // MARK: - Table view data source

    //섹션의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    //섹션별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //출력할 배열의 데이터 개수만큼 행을 생성
        return titles.count
    }

    //셀을 만들어서 설정하는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //기존 주어진 형식에서 주석만 지원서 사용하려고 하면
        //dequeReusableCell을 사용하려면 이전에 사용하던게 있어야 하는데 없어서 에러 발생
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
      
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = titles[indexPath.row]
        return cell
    }
    
    //셀을 선택했을 때 호출괴는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //선택한 셀의 링크를 가져오기
        let addr = links[indexPath.row]
        //하위 뷰 컨트롤러 생성
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //데이터 넘겨주기
        detailViewController.addr = addr
        //출력
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RootViewController : XMLParserDelegate{
    
    //여는 태그를 만났을 때 호출되는 메소드
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //속성이 잇으면 속성을 읽기
        //속성이 없으면 별도로 할일은 없음
    }

    //여는 태그와 닫는 태그안의 내용을 만났을 때 호출되는 메소드
    func parser(_ parser:XMLParser, foundCharacters string:String){
        //태그 안의 내용을 contents에 저장
        contents = string
    }
    
    //닫는 태그를 만났을 때 호출되는 메소드
    func parser(_ parser:XMLParser, didEndElement elementName:String, namespaceURI:String?, qualifiedName qName:String?){
        //저장하고자 하는 태그를 닫을 때 내용을 저장
        if elementName == "title"{
            titles.append(contents)
        }else if elementName == "link"{
            links.append(contents)
        }
        contents = nil
    }
}
