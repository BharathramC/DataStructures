//: Playground - noun: a place where people can play

import Foundation

class Node{
    
    var data : Int
    var nodeBehind : Node?
    
    init() {
        data = 0
        nodeBehind = nil
    }
}

class Queue{
    var head : Node?
    var tail : Node?

    func enqueue(inputdata: Int){
        var newNode = Node()
        newNode.data = inputdata
        
        if head == nil && tail == nil{
            head = newNode
            tail = newNode
        }else{
            if head === tail{
                head?.nodeBehind = newNode
                tail = newNode
            }else{
                tail?.nodeBehind = newNode
                tail = newNode
            }
        }
        self.printQueue()
    }
    
    func dequeue(){
        if head == nil{
            print("Queue is Empty")
        }else{
            if head === tail{
                print("Last Element in Queue")
                head = nil
                tail = nil
            }else{
                var nodeToDelete = head
                head = head?.nodeBehind
                nodeToDelete = nil
            }
            
        }
        printQueue()
    }
    
    func printQueue(){
        if head == nil{
            print("No Elements in Queue")
        }else{
            var traverseNode = head
            print("Head ---> ")
            repeat{
                print("\(traverseNode!.data)")
                traverseNode = traverseNode!.nodeBehind
            } while(traverseNode != nil)
            print(" <--- Tail")
        }
    }
    
    init() {
        head = nil
        tail = nil
    }
}

var myQ = Queue()
myQ.printQueue()
myQ.enqueue(inputdata: 1)
myQ.enqueue(inputdata: 12)
myQ.enqueue(inputdata: 134)

myQ.dequeue()
myQ.dequeue()
myQ.dequeue()
