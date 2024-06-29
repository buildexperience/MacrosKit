//
//  ArgumentFactory.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

/// Factory for getting the value of an ``ExprSyntax``.
internal enum ArgumentFactory {
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
        
        return nil
    }
}
