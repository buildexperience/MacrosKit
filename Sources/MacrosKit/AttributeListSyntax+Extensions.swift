//
//  AttributeListSyntax+Extensions.swift
//
//
//  Created by Joe Maghzal on 08/06/2024.
//

import SwiftSyntax

extension AttributeListSyntax.Element {
    /// The attribute syntax .
    /// 
    /// - Returns: An optional ``AttributeSyntax`` representing the attribute syntax,
    /// or ``nil`` if the node is not an attribute syntax.
    public var attribute: AttributeSyntax? {
        return self.as(AttributeSyntax.self)
    }
    
    /// The name of the attribute.
    ///
    /// - Returns: An optional ``TokenSyntax`` representing the name of the attribute,
    /// or ``nil`` if the name cannot be determined.
    public var name: TokenSyntax? {
        let attributeName = attribute?.attributeName.as(IdentifierTypeSyntax.self)
        return attributeName?.name
    }
    
    /// The macro arguments.
    ///
    /// - Returns: An array of ``(name: TokenSyntax?, value: TokenSyntax?)`` representing the arguments.
    public var arguments: [(name: TokenSyntax?, value: TokenSyntax?)] {
        guard let arguments = attribute?.arguments?.as(LabeledExprListSyntax.self) else {
            return []
        }
        return arguments.map { argument in
            let expression = argument.expression
            let name = argument.label
            let value = ArgumentFactory.make(for: expression)
            
            return (name: name, value: value)
        }
    }
}
