import MapKit
import Combine
import SwiftUI


final class Data: BindableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    
    private let fm = FileManager.default
    private let path = Bundle.main.resourcePath!
    private let items: [String]
    static var pictures:[String] = []
    

    init() {
        self.items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("nssl") && !Data.pictures.contains(item) {
                Data.pictures.append(item)
            }
        }
        Data.pictures.sort()
    }
    
    

}
