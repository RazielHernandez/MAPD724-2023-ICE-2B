import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHight: CGFloat?

class GameScene: SKScene
{
    
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Islands?
    var cloud: Cloud?
    
    override func sceneDidLoad()
    {
        screenWidth = screenSize.width
        screenHight = screenSize.height
        print("Screen bounds: width\(String(describing: screenWidth)) & height\(String(describing: screenHight))")
        name = "GAME"
        
        //first ocean
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        //second ocean
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        player = Player()
        //player?.Reset()
        addChild(player!)
        
        island = Islands()
        addChild(island!)
        
        cloud = Cloud()
        addChild(cloud!)
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -500))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -500))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -500))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        cloud?.Update()
    }
}
