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
        zPosition = 0
        verticalSpeed = 5.0
        
    }
    
    override func Update() {
        Move()
        CheckBound()
    }
    
    override func CheckBound() {
        if (position.y <= -2107){
            Reset()
        }
    }
    
    override func Reset() {
        position.y = 2107
    }
    
    func Move(){
        position.y -= verticalSpeed!
    }
}
