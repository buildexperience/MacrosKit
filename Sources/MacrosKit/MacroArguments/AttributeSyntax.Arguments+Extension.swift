//
//  AttributeSyntax.Arguments+Extension.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension AttributeSyntax.Arguments {
    /// The macro arguments.
    ///
    /// - Returns: A dictionary ``[String?: TokenSyntax]`` representing the arguments.
    public var arguments: [String?: TokenSyntax] {
        guard let arguments = self.as(LabeledExprListSyntax.self) else {
            return [:]
        }
        var dictionary = [String?: TokenSyntax]()
        
        for argument in arguments {
            let expression = argument.expression
            let name = argument.label?.text
            let value = ArgumentFactory.make(for: expression)
            dictionary[name] = value
        }
        
        return dictionary
    }
}
