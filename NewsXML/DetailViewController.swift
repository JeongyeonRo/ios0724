
import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    //var addr : String = ""
    //nli을 저장할 수 있게 변수를 만들경우 아래와 같이 생성
    var addr : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: addr)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
