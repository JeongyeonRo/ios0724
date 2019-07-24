
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //구글의 텍스트 가져오기
        var url = URL(string:"https://www.google.com")
        //웹에서 데이터를 byte 배열로 가져오기
        //unwrapped 에러가 나면 - ?나 !를 붙임
        //Call can throw, but it is not marked with 'try' and the error is not handled
        //예외처리를 강제하기 때문에 try!를 이용해서 예외처리를 하지 않음을 명시
        let googleText = try! Data(contentsOf: url!)
        //byte 배열을 문자열로 가져오기
        let google = String(data: googleText, encoding: .utf8)
        //텍스트 뷰에 출력
        tv.text = google
        
        //이미지 파일의 URL을 생성
        //url = URL(string:"https://t1.daumcdn.net/news/201907/13/newsen/20190713224001158jsim.jpg")
        url = URL(string:"https://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile271.uf.daum.net/image/991E39495D00BC521B5AB6")
        //Transport Security has blocked a cleartext HTTP - 보안 설정이 되지 않으면 http 주소는 가져오는데 에러가 남
        let iu = try! Data(contentsOf: url!)
        let image = UIImage(data:iu)
        imgView.image = image
        
    }


}

