import Fundation

let dispatchSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
var accountBalance: Int = 1000

func withdraw(amount: Int) {
    dispatchSemaphore.wait()
    defer{
        dispatchSemaphore.signal()
    }
        if accountBalance >= amount {
            Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
            } else {
                print("Insufficient funds")
            }
}

func refillBalance(amount: Int) {
    dispatchSemaphore.wait()
    defer{
        dispatchSemaphore.signal()
    }
        Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
}

for __in 1...5{
    withdraw(amount: 100)
    refillBalance(amount: 100)
}
Thread.sleep(forTimeInterval: 3)