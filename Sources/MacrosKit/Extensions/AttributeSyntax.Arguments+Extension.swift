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
    /// - Returns: A dictionary ``[TokenSyntax?: TokenSyntax]`` representing the arguments.
    public var arguments: [String?: TokenSyntax] {
        guard let arguments = self.as(LabeledExprListSyntax.self) else {
            return [:]
        }
        
        return arguments.reduce(into: [:]) { partialResult, argument in
            let expression = argument.expression
            let name = argument.label?.text
            let value = ArgumentFactory.make(for: expression)
            partialResult[name] = value
        }
    }
}

/// Factory for getting the value of an ``ExprSyntax``.
fileprivate enum ArgumentFactory {
    fileprivate static func make(for syntax: ExprSyntax) -> TokenSyntax? {
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
