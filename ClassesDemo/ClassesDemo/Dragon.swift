
class Dragon: Enemy {
    var wingspan = 2
    
    func talk(_ speech: String) {
        print("Speech: \(speech)")
    }
    
    override func move() {
        print("Fly forwards!")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage.")
    }
}
