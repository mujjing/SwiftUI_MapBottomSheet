//
//  Extensions.swift
//

import SwiftUI

extension View {
    @ViewBuilder
    func bottomSheet<Content: View> (
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        sheetCornerRadius: CGFloat?,
        largestundimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransprentBG: Bool = false,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping ()->Content,
        onDismiss: @escaping ()->()
    ) -> some View {
        self.sheet(isPresented: isPresented) {
            onDismiss()
        } content: {
            content()
                .presentationDetents(presentationDetents)
                .presentationDragIndicator(dragIndicator)
        }
    }
}
