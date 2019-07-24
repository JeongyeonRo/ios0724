
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //이미지 파일 이름을 저장할 배열을 생성
    var images : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //이미지 파일 이름들을 배열에 추가
        //car00.jpg ~ car24.jpg 까지의 이미지 파일 규칙 활용
        for i in 0...24{
            //%02 - 숫자를 2자리로 표현(00,01,02...)
            let imageName : String = String(format:"car%02i.jpg",i)
            images.append(imageName)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //셀의 개수를 설정하는 메소드 - 리턴값이 정수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //images 배열의 개수만큼 셀을 생성
        return images.count
    }
    
    //셀의 모양을 설정하는 메소드 - 리턴값이 UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for:indexPath) as! CustomCell
        //이미지 설정
        cell.imageView.image = UIImage(named: "car/\(images[indexPath.row])")
        return cell
    }
    
    //셀의 사이즈를 만들어주는 메소드 - 리턴값이 CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //컬렉션 뷰의 전체 너비의 1/3
        let width = collectionView.frame.width / 3 - 1
        //크기를 만들어서 리턴: 너비와 높이가 같으므로 정사각형
        return CGSize(width: width, height:width)
    }
    
    //셀의 사이의 간격을 설정하는 메소드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //셀 안에서 아이템과 외부 경계와의 간격을 설정하는 메소ㄷ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //셀이 선택되고 난 후 호출되는 메소드
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath){
        //셀의 인덱스에 해당하는 Cell을 찾아옵니다.
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.blue.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
    //셀을 누르고 있을 때 호출되는 메소드
    func collectionView(_ collectionView:UICollectionView, didHighlightItemAt indexPath:IndexPath){
        //셀의 인덱스에 해당하는 Cell을 찾아옵니다.
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.red.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
    //셀을 누르고 있을 때 호출되는 메소드
    func collectionView(_ collectionView:UICollectionView, didUnhighlightItemAt indexPath:IndexPath){
        //셀의 인덱스에 해당하는 Cell을 찾아옵니다.
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = nil
        cell?.layer.borderWidth = 3.0
    }
    
}
