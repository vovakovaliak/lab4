import Foundation

let myOperationQueue: OperationQueue = OperationQueue()
var accountBalance: Int = 1000

func withdraw(amount: Int) {
myOperationQueue. addOperation{
if accountBalance >= amount {

accountBalance -= amount
print("Withdrawal successful. Remaining balance: \(accountBalance)")
} else {

print("Insufficient funds")

func refillBalance(amount: Int) {
myOperationQueue. addOperation{

accountBalance += amount
print("Refill successful. Remaining balance: \(accountBalance)")

for _ini...5{
withdraw(amount: 100)
refillBalance(amount: 100)

Thread.sleep(forTimeInterval: 3)