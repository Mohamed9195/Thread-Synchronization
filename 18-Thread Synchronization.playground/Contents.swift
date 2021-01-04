import UIKit

func doSomethingFromJSON1() {print("doSomethingFromJSON1")}
func doSomethingFromJSON2() {print("doSomethingFromJSON2")}
func downloadImage() {print("downloadImage")}

func finishFunction() {
    print("Finish")
}

func doItAll() {
    let dispatchGroup = DispatchGroup()

    dispatchGroup.enter()
    DispatchQueue.global().async {
        doSomethingFromJSON1()
        dispatchGroup.leave()
    }

    dispatchGroup.enter()
    DispatchQueue.global().async {
        doSomethingFromJSON2()
        dispatchGroup.leave()
    }

    dispatchGroup.enter()
    DispatchQueue.global().async {
        downloadImage()
        dispatchGroup.leave()
    }

    dispatchGroup.notify(queue: .global()) {
        finishFunction()
    }
}
doItAll()
