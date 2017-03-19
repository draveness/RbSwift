//
//  Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringInflectionSpec: QuickSpec {
    override func spec() {
        describe(".camelize(upper:)") {
            it("returns the camelize string") {
                expect("os_version".camelize).to(equal("OsVersion"))
                expect("os_version_ten".camelize).to(equal("OsVersionTen"))
                expect("os_version_TEn".camelize).to(equal("OsVersionTen"))
                expect("os_version".camelize(.lower)).to(equal("osVersion"))
            }
        }
        
        describe(".underscore") {
            it("returns the snake case string") {
                expect("OsVersionTen".underscore).to(equal("os_version_ten"))
                expect("osVersionTen".underscore).to(equal("os_version_ten"))
                expect("osVerSionTen".underscore).to(equal("os_ver_sion_ten"))
            }
        }
        
        describe(".singularize") {
            it("returns the singularize form of string") {
                expect("people".singularize).to(equal("person"))
                expect("monkeys".singularize).to(equal("monkey"))
                expect("users".singularize).to(equal("user"))
                expect("men".singularize).to(equal("man"))
            }
        }
        
        describe(".pluralize") {
            it("returns the pluralize form of string") {
                expect("person".pluralize).to(equal("people"))
                expect("monkey".pluralize).to(equal("monkeys"))
                expect("user".pluralize).to(equal("users"))
                expect("man".pluralize).to(equal("men"))
            }
            
            it("is identical to singularize it count == 1") {
                expect("men".pluralize(1)).to(equal("man"))
            }
        }
        
        describe(".tableize") {
            it("creates the name of a table like Rails does for models to table names") {
                expect("RawScaledScorer".tableize).to(equal("raw_scaled_scorers"))
                expect("egg_and_ham".tableize).to(equal("egg_and_hams"))
                expect("fancyCategory".tableize).to(equal("fancy_categories"))
            }
        }
        
        describe(".foreignKey(separate:)") {
            it("returns a foreign key with current string") {
                expect("people".foreignKey).to(equal("people_id"))
                expect("people".foreignKey).to(equal("people_id"))
                expect("MessageQueue".foreignKey).to(equal("message_queue_id"))
                expect("MessageQueue".foreignKey(false)).to(equal("message_queueid"))
            }
        }
    }
}

