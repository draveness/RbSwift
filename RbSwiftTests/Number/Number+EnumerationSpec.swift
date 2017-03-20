//
//  Numer+EnumerationSpec.swift
//  RbSwift
//
//  Created by draveness on 20/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberEnumerationSpec: QuickSpec {
    
    override func spec() {
        describe(".downto(limit:)") {
            it("returns an array of integer") {
                expect(3.downto(1)).to(equal([3, 2, 1]))
                expect(3.downto(-2)).to(equal([3, 2, 1, 0, -1, -2]))
                expect(3.downto(-2, step: 2)).to(equal([3, 1, -1]))
                expect(3.downto(3)).to(equal([3]))
                expect(3.downto(4)).to(equal([]))
            }
            
            it("enumerates all integer from self to limit") {
                var result: [Int] = []
                3.downto(1) { result.append($0) }
                expect(result).to(equal([3, 2, 1]))
            }
        }
        
        describe(".upto(limit:)") {
            it("returns an array of integer") {
                expect(1.upto(3)).to(equal([1, 2, 3]))
                expect((-2).upto(3)).to(equal([-2, -1, 0, 1, 2, 3]))
                expect((-2).upto(3, step: 2)).to(equal([-2, 0, 2]))
                expect(3.upto(3)).to(equal([3]))
                expect(3.upto(4)).to(equal([3, 4]))
            }
            
            it("enumerates all integer from self to limit") {
                var result: [Int] = []
                1.upto(3) { result.append($0) }
                expect(result).to(equal([1, 2, 3]))
            }
        }
        
        describe(".times(closure:)") {
            it("executes block for serveral times") {
                var arr: [Int] = []
                3.times { arr.append($0) }
                expect(arr).to(equal([0, 1, 2]))
                
                var arr1: [Int] = []
                3.times { arr1.append(1) }
                expect(arr1).to(equal([1, 1, 1]))
            }
        }
    }
}
