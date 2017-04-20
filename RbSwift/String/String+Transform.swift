//
//  Transform.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    /// Returns a new String with the \n, \r, \v, " " and \r\n removed from the end of str,
    ///
    /// 	"1Hello\r1\n".chomp         #=> "1Hello\r1"
    /// 	"Hello\r\n\r\n".chomp		#=> "Hello"
    /// 	"Hello\n".chomp             #=> "Hello"
    /// 	"Hello  ".chomp             #=> "Hello"
    /// 	"Hello  \r".chomp           #=> "Hello"
    /// 	"  Hello  \r".chomp         #=> "  Hello"
    /// 	"".chomp                    #=> ""
    ///
    var chomp: String {
        guard self.length > 0 else { return "" }
        var result = self
        while let last = result.characters.last {
            guard last =~ "[ \t\n\r\\v]" else { break }
            result = result.chop
        }
        return result
    }
    
    /// Returns a new String with the seaprator removed from the end of str (if present).
    ///
    ///
    /// 	"Hello\r\n".chomp("o\r\n")		#=> "Hell"
    /// 	"Hello".chomp("o\r\n")          #=> "Hello"
    ///
    /// If separator is an empty string, it will remove all trailing newlines from the string.
    ///
    /// 	"Hello\r\n\r\n".chomp("")		#=> "Hello"
    /// 	"Hello\r\n\r\r\n".chomp("")		#=> "Hello\r\n\r"
    ///
    /// - Parameter separator: A string used to chomp from the end of the string
    /// - Returns: A new string with the end of str being chomped from the receiver
    func chomp(_ separator: String = "") -> String {
        guard self.length > 0 else { return "" }
        guard separator.length > 0 else {
            var result = self
            while result.length > 0 {
                if let lastChar = result.characters.last {
                    if lastChar == "\r\n" {
                        result = result.chop
                    } else {
                        break
                    }
                }
            }
            return result
        }
        guard hasSuffix(separator) else { return self }
        let substring = self.substring(to: self.length - separator.length)
        return substring
    }
    
    /// Modifies str in place as described for .chomp(separator:), returning str.
    ///
    /// - Parameter separator: A string used to chomp from the end of the string
    /// - Returns: Self
    @discardableResult
    mutating func chomped(_ separator: String = "") -> String {
        self = chomp(separator)
        return self
    }
    
    /// Return a new string with the last char removed from the receiver
    ///
    /// 	"Hello\r\n\r\n".chop		#=> "Hello\r\n"
    /// 	"Hello\r\n".chop            #=> "Hello"
    /// 	"Hello\n\r".chop            #=> "Hello\n"
    /// 	"Hello\n".chop              #=> "Hello"
    /// 	"x".chop                    #=> ""
    ///
    /// This methods will return a empty string if the receiver length is less than or equal to 0.
    ///
    /// 	"".chop.chop                #=> ""
    ///
    var chop: String {
        guard self.length > 0 else { return "" }
        var result = self
        result.remove(at: result.index(before: result.endIndex))
        return result
    }
    
    /// Modifies str in place as described for .chop, returning str.
    ///
    /// - Returns: Self
    @discardableResult
    mutating func choped() -> String {
        self = chop
        return self
    }
    
    /// Makes string empty.
    ///
    ///     var s = "xyz"
    /// 	s.cleared()		#=> ""
    /// 	s               #=> ""
    ///
    /// - Returns: A empty string
    @discardableResult
    mutating func cleared() -> String {
        self = ""
        return self
    }
    
    /// Each `strs` parameter defines a set of characters to count. The intersection of these sets
    /// defines the characters to count in str.
    ///
    ///     let a = "hello world"
    /// 	a.count("lo")               #=> 5
    /// 	a.count("lo", "o")          #=> 2
    ///
    /// Any `strs` that starts with a caret ^ is negated.
    ///
    /// 	a.count("hello", "^l")		#=> 4
    ///
    /// The sequence c1-c2 means all characters between c1 and c2.
    ///
    /// 	a.count("ej-m")             #=> 4
    ///
    /// The backslash character \ can be used to escape ^ or - and is otherwise ignored unless 
    /// it appears at the end of a sequence or the end of a `strs`.
    ///
    /// 	"hello^world".count("\\^aeiou")		#=> 4
    /// 	"hello-world".count("a-eo")         #=> 4
    ///
    ///     let c = "hello world\\r\\n"
    /// 	c.count("\\A")                  #=> 0
    /// 	c.count("X\\-\\\\w")            #=> 3
    ///
    /// - Parameter strs: An array of string used to match the receiver string
    /// - Returns: The count of all the matched characters
    func count(_ strs: String...) -> Int {
        let strs = strs.map { "[\($0)]" }
        let sets = strs.map { Set<MatchData>($0.regex.scan(self)) }
        guard let first = sets.first else { return 0 }
        return sets.reduce(first, { (result, set) in
            result.intersection(set)
        }).count
    }
    
    /// Returns a copy of str with all characters in the intersection of its arguments deleted.
    /// Uses the same rules for building the set of characters as `String#count(strs:)`.
    ///
    ///     let a = "hello world"
    /// 	a.delete("lo")              #=> "he wrd"
    /// 	a.delete("lo", "o")         #=> "hell wrld"
    /// 	a.delete("hello", "^l")		#=> "ll wrld"
    /// 	a.delete("ej-m")            #=> "ho word"
    ///
    /// 	"hello^world".delete("\\^aeiou")    #=> "hllwrld"
    /// 	"hello-world".delete("a-eo")		#=> "hll-wrl"
    /// 	"hello-world".delete("a\\-eo")		#=> "hllwrld"
    ///
    ///     let c = "hello world\\r\\n"
    /// 	c.delete("\\A")             #=> "hello world\\r\\n"
    /// 	c.delete("X\\-\\\\w")		#=> "hello orldrn"
    ///
    /// - Parameter strs: An array of string used to match the receiver string
    /// - Returns: A string with all chars in strs deleted
    /// - See Also: `String#count(strs:)`
    func delete(_ strs: String...) -> String {
        return self.delete(strs)
    }
    
    /// Returns a copy of str with all characters in the intersection of its arguments deleted.
    /// Uses the same rules for building the set of characters as `String#count(strs:)`.
    ///
    ///     let a = "hello world"
    /// 	a.delete("lo")              #=> "he wrd"
    /// 	a.delete("lo", "o")         #=> "hell wrld"
    /// 	a.delete("hello", "^l")		#=> "ll wrld"
    /// 	a.delete("ej-m")            #=> "ho word"
    ///
    /// 	"hello^world".delete("\\^aeiou")    #=> "hllwrld"
    /// 	"hello-world".delete("a-eo")		#=> "hll-wrl"
    /// 	"hello-world".delete("a\\-eo")		#=> "hllwrld"
    ///
    ///     let c = "hello world\\r\\n"
    /// 	c.delete("\\A")             #=> "hello world\\r\\n"
    /// 	c.delete("X\\-\\\\w")		#=> "hello orldrn"
    ///
    /// - Parameter strs: An array of string used to match the receiver string
    /// - Returns: A string with all chars in strs deleted
    /// - See Also: `String#count(strs:)`
    func delete(_ strs: [String]) -> String {
        let strs = strs.map { "[\($0)]" }
        let sets = strs.map { Set<MatchData>($0.regex.scan(self)) }
        guard let first = sets.first else { return self }
        var result = self.bridge
        sets.reduce(first, { (result, set) in
            result.intersection(set)
        }).sorted(by: { (lhs, rhs) -> Bool in
            return lhs.range.location >= rhs.range.location
        }).forEach { data in
            result = result.replacingCharacters(in: data.range, with: "").bridge
        }
        return result.bridge
    }
    
    /// Use `delete(strs:)` to mutate `self` in place, see also `delete(strs:)`
    ///
    /// - Parameter strs: An array of string used to match the receiver string
    /// - Returns: Self
    @discardableResult
    mutating func deleted(_ strs: String...) -> String {
        self = delete(strs)
        return self
    }
    
    /// Reverses all characters in the string.
    ///
    /// 	"Hello".reverse		#=> "olleH"
    ///
    var reverse: String {
        return String(self.characters.reversed())
    }
    
    /// Modifies str in place as described for .reverse, returning str.
    ///
    /// - Returns: Self
    @discardableResult
    mutating func reversed() -> String {
        self = reverse
        return self
    }
    
    /// Divides str into substrings based on a delimiter, returning an array of these substrings.
    ///
    /// 	" now's  the time".split            #=> ["now's", "the", "time"]
    /// 	" now's\nthe time\n\t".split		#=> ["now's", "the", "time"]
    ///
    var split: [String] {
        return split(" ")
    }
    
    /// Divides str into substrings based on a delimiter, returning an array of these substrings. (default is " ")
    /// If pattern is a `String`, then its contents are used as the delimiter when splitting str. 
    ///
    /// 	"mellow yellow".split("ello")		#=> ["m", "w y", "w"]
    /// 	"1,2,,3,4,,".split(",")             #=> ["1", "2", "", "3", "4"]
    ///
    /// If pattern is a single space, str is split on whitespace, with leading whitespace and runs
    /// of contiguous whitespace characters ignored.
    ///
    /// 	" now's  the time".split(" ")		#=> ["now's", "the", "time"]
    ///
    /// If pattern is an empty string, str is split into chars.
    ///
    /// 	"hello".split("")                   #=> ["h", "e", "l", "l", "o"]
    ///
    /// If pattern is a `Regex`, str is divided where the pattern matches. Whenever the pattern matches
    /// a zero-length string, str is split into individual characters.
    ///
    /// 	"hello".split("l+")                 #=> ["he", "o"]
    ///
    /// If pattern contains groups, the respective matches will be returned in the array as well.
    ///
    /// 	"red yellow and blue".split("[ae ]")		#=> ["r", "d", "y", "llow", "", "nd", "blu"]
    ///
    /// - Parameter separator: A string to seperate the receiver
    /// - Returns: An array of string which separated by separator
    func split(_ separator: RegexConvertible = " ", limit: Int = 0) -> [String] {
        guard separator.pattern.length > 0 else { return self.characters.map { String($0) } }
        let result = trimmingCharacters(in: CharacterSet.whitespaces)
        guard separator.pattern != " " else { return result.components(separatedBy: CharacterSet.whitespacesAndNewlines).filter { !$0.isEmpty } }
        let datas = separator.regex.scan(self)
        var results: [String] = []
        var traceIndex: Int = 0
        for data in datas {
            if let str = self.range(traceIndex, data.range.location - 1) {
                results.append(str)
                traceIndex = data.range.location + data.range.length
            }
        }
        if traceIndex < self.length {
            results.append(self.from(traceIndex)!)
        }

        while let first = results.first {
            if first.isEmpty {
                results.remove(at: 0)
            } else {
                break
            }
        }
        
        while let last = results.last {
            if last.isEmpty {
                results = Array(results.dropLast())
            } else {
                break
            }
        }
        return results
    }
    
    /// If integer is greater than the length of str, returns a new String of length integer 
    /// with str left justified and padded with padstr; otherwise, returns str.
    ///
    /// 	"hello".ljust(20)               #=> "hello               "
    /// 	"hello".ljust(20, "1234")		#=> "hello123412341234123"
    /// 	"hello".ljust(4)                #=> "hello"
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to ljust
    func ljust(_ length: Int, _ padding: String = " ") -> String {
        guard self.length < length else { return self }
        let padding = padding.length == 0 ? " " : padding
        var result = self
        while result.length < length {
            result += padding
        }
        return result.substring(to: length)
    }
    
    /// If integer is greater than the length of str, returns a new String of length integer
    /// with str right justified and padded with padstr; otherwise, returns str.
    ///
    /// 	"hello".rjust(20)               #=> "               hello"
    /// 	"hello".rjust(20, "1234")		#=> "123412341234123hello"
    /// 	"hello".rjust(4)                #=> "hello"
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to rjsut
    func rjust(_ length: Int, _ padding: String = " ") -> String {
        guard self.length < length else { return self }
        let padding = padding.length == 0 ? " " : padding
        var result = ""
        let paddingLength = length - self.length
        while result.length < paddingLength {
            result += padding
        }
        return result.substring(to: paddingLength) + self
    }
    
    /// Centers str in width. If width is greater than the length of str, 
    /// returns a new String of length width with str centered and padded 
    /// with padstr; otherwise, returns str.
    ///
    /// 	"hello".center(20)              #=> "       hello        "
    /// 	"hello".center(20, "123")		#=> "1231231hello12312312"
    /// 	"hello".center(4)               #=> "hello"
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to center
    func center(_ width: Int, _ padding: String = " ") -> String {
        guard self.length < width else { return self }
        let leftLength: Int = (width - self.length) / 2
        let rightLength = width - self.length - leftLength
        
        let left = (padding * (leftLength / padding.length + 1)).to(leftLength - 1)!
        let right = (padding * (rightLength / padding.length + 1)).to(rightLength - 1)!
        return left + self + right
    }
    
    /// Returns a copy of str with leading and trailing whitespace removed.
    ///
    /// 	"\t \nhello  ".strip		#=> "hello"
    /// 	"\t hello   ".strip         #=> "hello"
    /// 	"hello   ".strip            #=> "hello"
    ///
    var strip: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Removes leading and trailing whitespace from str.
    ///
    /// - Returns: Self
    /// - See Also: `String#strip`
    @discardableResult
    mutating func stripped() -> String {
        self = strip
        return self
    }
    
    /// Returns a copy of str with leading whitespace removed.
    ///
    /// 	"\t \nhello".lstrip         #=> "hello"
    /// 	"\t hello   ".lstrip		#=> "hello   "
    ///
    /// - See Also: `String#rstrip` and `String#strip`
    var lstrip: String {
        var result = self
        while let first = result.characters.first {
            guard first =~ "[ \t\n\r\\v]" else { break }
            result.remove(at: result.startIndex)
        }
        return result
    }
    
    /// Removes leading whitespace from str.
    ///
    /// - Returns: Self
    /// - See Also: `String#rstrip` and `String#strip`
    @discardableResult
    mutating func lstripped() -> String {
        self = lstrip
        return self
    }
    
    /// Returns a copy of str with trailing whitespace removed. See also `strip` and `lstrip`.
    ///
    /// 	"\t \nhello  ".rstrip		#=> "\t \nhello"
    /// 	"\t hello   ".rstrip		#=> "\t hello"
    ///
    var rstrip: String {
        return chomp
    }
    
    /// Removes trailing whitespace from str.
    ///
    /// - Returns: Self
    /// - See Also: `String#rstrip` and `String#strip`
    @discardableResult
    mutating func rstripped() -> String {
        self = rstrip
        return self
    }
    
    /// Concatenates the given str to the receiver
    ///
    /// 	"Hello".concat(" World")		#=> "Hello World"
    ///
    /// - Parameter other: A string use to concat to the receiver
    /// - Returns: A new string with self + other
    func concat(_ other: String) -> String {
        return self + other
    }
    
    /// Similar to `append` method, prepend another string to the receiver.
    ///
    ///     var str = "yz"
    /// 	str.prepend("x")    #=> "xyz"
    /// 	str                 #=> "xyz"
    ///
    /// - Parameter other: Anothing string
    /// - Returns: Self
    @discardableResult
    mutating func prepend(_ other: String) -> String {
        self = other + self
        return self
    }
    
    /// Replace the receiver string by the passing parameter
    ///
    ///     var str = "yz"
    /// 	str.replace("x")    #=> "x"
    /// 	str                 #=> "x"
    ///
    /// - Parameter other: A new string used to replace self
    /// - Returns: Self
    @discardableResult
    mutating func replace(_ other: String) -> String {
        self = other
        return self
    }
    
    /// Searches sep or pattern (Regex) in the string and returns the part 
    /// before it, the match, and the part after it. 
    ///
    /// 	"hello".partition("l")		#=> ["he", "l", "lo"]
    ///
    /// If it is not found, returns two empty strings and str.
    ///
    /// 	"hello".partition("le")		#=> ["hello", "", ""]
    ///
    /// - Parameter pattern: A string used to separate the receiver
    /// - Returns: An array of string which separated by seperator
    func partition(_ pattern: RegexConvertible) -> [String] {
        guard let data = match(pattern),
            let head = self.to(data.range.location - 1),
            let tail = self.from(data.range.location + data.range.length) else { return [self, "", ""] }
        return [head, data.match, tail]
    }
    
    /// Searches sep or pattern (regexp) in the string from the end of the 
    /// string, and returns the part before it, the match, and the part after it. 
    ///
    /// 	"hello".rpartition("l")         #=> ["hel", "l", "o"]
    ///
    /// If it is not found, returns two empty strings and str.
    ///
    /// 	"hello".rpartition("le")		#=> ["", "", "hello"]
    ///
    /// - Parameter pattern: A string used to separate the receiver
    /// - Returns: An array of string which separated by seperator
    func rpartition(_ pattern: RegexConvertible) -> [String] {
        guard let data = scan(pattern).last,
            let head = self.to(data.range.location - 1),
            let tail = self.from(data.range.location + data.range.length) else { return ["", "", self] }
        return [head, data.match, tail]
    }
}
