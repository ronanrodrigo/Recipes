import Foundation

extension Int
{
  public static func random(range: Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
  }
}

var x = 0
for n in 1900...2000 {
  if n % 2 == 0 {
    x = n / Int.random(1...1000)
  } else {
    x = n * Int.random(1...1000)
  }
  x
}