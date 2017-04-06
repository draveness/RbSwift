//
//  Inflections.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Inflections
public extension String {
    /// An enum used to control the output of camelize as parameter
    ///
    /// - upper: Return the UppcaseCamelCase when specified
    /// - lower: Return the lowerCamelCase when specified
    public enum LetterCase {
        case upper
        case lower
    }
    
    /// By default, `camelize` converts strings to UpperCamelCase.
    ///
    /// 	"os_version".camelize		#=> "OsVersion"
    /// 	"os_version_ten".camelize		#=> "OsVersionTen"
    /// 	"os_version_TEn".camelize		#=> "OsVersionTen"
    ///
    /// If the argument to camelize is set to `.lower` then camelize produces lowerCamelCase.
    ///
    /// 	"os_version".camelize(.lower)		#=> "osVersion"
    ///
    /// - Parameter firstLetter: A flag to control result between UpperCamelCase(.upper) and lowerCamelCase(.lower), See also LetterCase
    /// - Returns: A string converts to camel case
    /// - SeeAlso: LetterCase
    func camelize(_ firstLetter: LetterCase = .upper) -> String {
        let source = gsub("[-_]", " ")
        if source.characters.contains(" ") {
            var first = source.substring(to: 1)
            first = firstLetter == .upper ? first.upcase : first.downcase
            let camel = source.capitalized.gsub(" ", "")
            let rest = String(camel.characters.dropFirst())
            return "\(first)\(rest)"
        } else {
            var first = source.substring(to: 1)
            first = firstLetter == .upper ? first.upcase : first.downcase
            let rest = String(source.characters.dropFirst())
            return "\(first)\(rest)"
        }
    }
    
    /// Creates a foreign key name from a class name.
    ///
    /// 	"people".foreignKey             #=> "people_id"
    /// 	"people".foreignKey             #=> "people_id"
    /// 	"MessageQueue".foreignKey		#=> "message_queue_id"
    ///
    /// Separate flag sets whether the method should put '_' between the name and 'id'.
    ///
    /// 	"MessageQueue".foreignKey(false)		#=> "message_queueid"
    ///
    /// - Parameter separate: A bool value sets whether the method should put '_' between the name and 'id'
    /// - Returns: A foreign key name string
    func foreignKey(_ separate: Bool = true) -> String {
        if separate {
            return underscore + "_id"
        } else {
            return underscore + "id"
        }
    }

    /// Converts strings to UpperCamelCase.
    ///
    /// 	"os_version".camelize		#=> "OsVersion"
    /// 	"os_version_ten".camelize		#=> "OsVersionTen"
    /// 	"os_version_TEn".camelize		#=> "OsVersionTen"
    ///
    /// - See Also: `String#camelize(firstLetter:)`
    var camelize: String {
        return camelize()
    }

    /// Returns the plural form of the word in the string.
    var pluralize: String {
        return inflector.pluralize(string: self)
    }
    
    /// Returns the plural form of the word in the string.
    ///
    /// 	"person".pluralize		#=> "people"
    /// 	"monkey".pluralize		#=> "monkeys"
    /// 	"user".pluralize		#=> "users"
    /// 	"man".pluralize		#=> "men"
    ///
    /// If the parameter count is specified, the singular form will be returned if count == 1.
    ///
    /// 	"men".pluralize(1)		#=> "man"
    ///
    /// For any other value of count the plural will be returned.
    ///
    /// - Parameter count: If specified, the singular form will be returned if count == 1
    /// - Returns: A string in plural form of the word
    func pluralize(_ count: Int = 2) -> String {
        if count == 1 { return singularize }
        return pluralize
    }
    
    /// The reverse of `pluralize`, returns the singular form of a word in a string.
    ///
    /// 	"people".singularize		#=> "person"
    /// 	"monkeys".singularize		#=> "monkey"
    /// 	"users".singularize         #=> "user"
    /// 	"men".singularize           #=> "man"
    ///
    var singularize: String {
        return inflector.singularize(string: self)
    }
    
    /// The reverse of `camelize`. Makes an underscored, lowercase form from the expression in the string.
    ///
    /// 	"OsVersionTen".underscore		#=> "os_version_ten"
    /// 	"osVersionTen".underscore		#=> "os_version_ten"
    /// 	"osVerSionTen".underscore		#=> "os_ver_sion_ten"
    ///
    var underscore: String {
        var word = self.gsub("([A-Z\\d]+)([A-Z][a-z])", "$1_$2")
        word.gsubed("([a-z\\d])([A-Z])", "$1_$2")
        //        word.tr("-".freeze, "_".freeze)
        word.downcased()
        return word
    }
    
    /// Creates the name of a table.
    /// This method uses the `String#pluralize` method on the last word in the string.
    ///
    /// 	"RawScaledScorer".tableize		#=> "raw_scaled_scorers"
    /// 	"egg_and_ham".tableize		#=> "egg_and_hams"
    /// 	"fancyCategory".tableize		#=> "fancy_categories"
    ///
    var tableize: String {
        return underscore.pluralize
    }
    
    /// Creates a foreign key name from a class name.
    ///
    /// 	"people".foreignKey             #=> "people_id"
    /// 	"people".foreignKey             #=> "people_id"
    /// 	"MessageQueue".foreignKey		#=> "message_queue_id"
    ///
    var foreignKey: String {
        return foreignKey()
    }
}
