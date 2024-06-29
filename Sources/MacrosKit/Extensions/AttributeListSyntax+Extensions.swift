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
    
    /// The argument name of the attribute.
    ///
    /// - Returns: An optional ``TokenSyntax`` representing the argument name of the attribute,
    /// or ``nil`` if the argument name cannot be determined.
    public var argumentName: TokenSyntax? {
        let arguments = attribute?.arguments
        let expression = arguments?.as(LabeledExprListSyntax.self)?.first?.expression
        let segment = expression?.as(StringLiteralExprSyntax.self)?.segments.first
        let attributeName = segment?.as(StringSegmentSyntax.self)?.content
        return attributeName
    }
}
