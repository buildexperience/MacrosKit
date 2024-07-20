//
//  ArgumentFactory.swift
//
//
//  Created by Joe Maghzal on 15/07/2024.
//

import SwiftSyntax

/// Factory for getting the value of an ``ExprSyntax``.
internal enum ArgumentFactory {
    /// Creates a ``TokenSyntax`` from the given macro argument.
    ///
    /// This method supports several expression types:
    /// - ``StringLiteralExprSyntax``.
    /// - ``MemberAccessExprSyntax``.
    /// - ``KeyPathExprSyntax``.
    /// - ``BooleanLiteralExprSyntax``.
    ///
    /// - Parameter syntax: The expression syntax to convert.
    ///
    /// - Returns: A ``TokenSyntax`` representing the given macro argument,
    /// or ``nil`` if the expression type is unsupported.
    internal static func make(for syntax: ExprSyntax) -> TokenSyntax? {
        if let stringExpression = syntax.as(StringLiteralExprSyntax.self),
           let segment = stringExpression.segments.first,
           let value = segment.as(StringSegmentSyntax.self)?.content
        {
            return value
        }
        
        if let memberExpression = syntax.as(MemberAccessExprSyntax.self),
           let base = memberExpression.base?.as(DeclReferenceExprSyntax.self)
        {
            return base.baseName
        }
        
        if let keyPathExpression = syntax.as(KeyPathExprSyntax.self),
           let firstComponent = keyPathExpression.components.first?.component,
           let component = firstComponent.as(KeyPathPropertyComponentSyntax.self)
        {
            return component.declName.baseName
        }
        
        if let boolExpression = syntax.as(BooleanLiteralExprSyntax.self) {
            return boolExpression.literal
        }
        
        return nil
    }
}
