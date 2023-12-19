import Foundation

let concurrentQueue: DispatchQueue = DispatchQueue(label1: "com.example.concurrentQueue", attributes: .concurrent)
var accountBalance: Int = 1000
let dispatchGroup: DispatchGroup = DispatchGroup()

func withdraw (amount: Int){
    concurrentQueue.async(group: dispatchGroup){
        if accountBalance >= amount {
            accountBalance -= amount
            print ("Withdrawal successful. Remaining balance: \(accountBalance)")
        }else{
            print("Insufficient funds")
        }
    }
}

func refillBalance(amount: Int){
    concurrentQueue.async(group: dispatchGroup){
        accountBalance += amount
        print ("Refill successful. Remaining balance: \(accountBalance)")

    }|
}

for _ in 1...5{
    withdraw(amount: 100)
    refillBalance(amount: 100)
}
Thread.sleep(forTimeInterval: 3)