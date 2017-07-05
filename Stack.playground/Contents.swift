//: Playground - noun: a place where people can play

// Created by Bharathram C
// Free for Educational Use

class Node{
    var data : Int = 0
    var nodeBelow : Node?
    
    init() {
        data = 0
        nodeBelow = nil
    }
}

class Stack{
    var head : Node? = nil
    
    func push(inputData : Int){
        var newNode = Node()
        newNode.data = inputData
        
        if head == nil{
            head = newNode
        }else{
            newNode.nodeBelow = head
            head = newNode
        }
        
        print("Node with data \(head?.data) inserted into stack")
    }
    
    func pop() -> Int{
        var valuePoped = 0
        if head == nil{
            print("Empty Stack - nothing to Pop")
        }else{
            if head?.nodeBelow == nil{
                print("Only one element present in stacking")
                valuePoped = (head?.data)!
            }else{
                valuePoped = (head?.data)!
                head? = (head?.nodeBelow)!
                print("Head Chnaged from \(valuePoped) to \(head?.data)")
            }
        }
        return valuePoped
    }
    
    func printStack(currentStack : Stack){
        
        if currentStack.head == nil{
            print("No Elements in Stack")
        }else{
            var traverseNode = currentStack.head
            repeat{
               print("--> \(traverseNode?.data)")
               traverseNode = traverseNode?.nodeBelow
            } while(traverseNode != nil)
        }
    }
    
    init() {
        head = nil
    }
}

var sampleStack = Stack()

sampleStack.push(inputData: 0)
sampleStack.push(inputData: 10)
sampleStack.printStack(currentStack: sampleStack)

sampleStack.push(inputData: 15)
sampleStack.push(inputData: 20)
sampleStack.printStack(currentStack: sampleStack)

sampleStack.pop()
sampleStack.printStack(currentStack: sampleStack)
sampleStack.pop()
sampleStack.pop()
sampleStack.pop()
sampleStack.printStack(currentStack: sampleStack)
