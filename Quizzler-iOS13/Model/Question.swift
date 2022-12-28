
import Foundation
struct Question
{
    let text:String
    let answer:[String]
    let correctAns:String
    init(q:String,a:[String],correctAnswer:String)
    {
        text=q
        answer=a
        correctAns=correctAnswer
    }
}
