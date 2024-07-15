//
//  LabeledExprListSyntax+Extensions.swift
//  
//
//  Created by Joe Maghzal on 15/07/2024.
//

import SwiftSyntax

extension LabeledExprListSyntax {
    /// The macro arguments.
    ///
    /// - Returns: A dictionary ``[String?: TokenSyntax]`` representing the arguments.
    public var arguments: [String?: TokenSyntax] {
        var dictionary = [String?: TokenSyntax]()
        
        for argument in self {
            let expression = argument.expression
            let name = argument.label?.text
            let value = ArgumentFactory.make(for: expression)
            dictionary[name] = value
        }
        
        return dictionary
    }
}
