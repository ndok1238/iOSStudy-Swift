/*
 Deinitialization
 
 deinitializer 는 임의의 class 인스턴스가 할당해제 되기 직전에 호출 됨
 deinit 키워드 안에 작성하며 class 타입 인스턴스에서만 사용할 수 있다
 
 스위프트에서는 ARC 에 의해 더이상 사용되지 않는 인스턴스는 자동으로 할당해제 된다.
 따라서 대부분의 경우 사용자가 직접 할당해제할 필요가 없다. 하지만 사용자의 인스턴스에서 직접 리소스를 할당하여 사용했다면, 해제할 때도 직접 해제해 주어야 한다.
 */

struct Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int){
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int){
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("a new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne?.win(coins: 2_000)
print("playerone won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne = nil
print("There are now \(Bank.coinsInBank) coins left in the bank")
