import GameplayKit
import SpriteKit

class Ocean: GameObject{
    
    init(){
        super.init(imageSrting: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
        
    }
    
    override func Update() {
        Move()
        CheckBound()
    }
    
    override func CheckBound() {
        if (position.y <= -2253){
            Reset()
        }
    }
    
    override func Reset() {
        position.y = 2253
    }
    
    func Move(){
        position.y -= verticalSpeed!
    }
}
