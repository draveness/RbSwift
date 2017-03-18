//
//  Inflections.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    public enum LetterCase {
        case upper
        case lower
    }
    
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
    
    func foreignKey(_ separate: Bool = true) -> String {
        if separate {
            return underscore + "_id"
        } else {
            return underscore + "id"
        }
    }

    var camelize: String {
        return camelize()
    }

    var pluralize: String {
        return inflector.pluralize(string: self)
    }
    
    var singularize: String {
        return inflector.singularize(string: self)
    }
    
    var underscore: String {
        var word = self.gsub("([A-Z\\d]+)([A-Z][a-z])", "$1_$2".freeze)
        word.gsubed("([a-z\\d])([A-Z])", "$1_$2".freeze)
        //        word.tr("-".freeze, "_".freeze)
        word.downcased()
        return word
    }
    
    var tableize: String {
        return underscore.pluralize
    }
    
    var foreignKey: String {
        return foreignKey()
    }
}
