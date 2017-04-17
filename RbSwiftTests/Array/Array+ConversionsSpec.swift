//
//  Array+ConversionsSpec.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayConversionsSpec: BaseSpec {
    override func spec() {
        describe(".to_i(base:)") {
            it("returns an integer") {
                expect([1,2,3].to_i()).to(equal(321))
                expect([1,2,3,4].to_i()).to(equal(4321))
                expect([0,0,0,1].to_i(2)).to(equal(8))
            }
        }
        
        describe(".to_sentence(wordsConnector:twoWordsConnector:lastWordsConnector:)") {
            it("converts the array to a comma-separated sentence where the last element is joined by the connector word") {
                expect([].to_sentence).to(equal(""))
                expect(["one"].to_sentence).to(equal("one"))
                expect(["one", "two"].to_sentence).to(equal("one and two"))
                expect(["one", "two", "three"].to_sentence).to(equal("one, two, and three"))
                expect(["one", "two"].to_sentence(twoWordsConnector: "-")).to(equal("one-two"))
                expect(["one", "two", "three"].to_sentence(wordsConnector: " or ", lastWordConnector: " or at least ")).to(equal("one or two or at least three"))
            }
        }
    }
}
