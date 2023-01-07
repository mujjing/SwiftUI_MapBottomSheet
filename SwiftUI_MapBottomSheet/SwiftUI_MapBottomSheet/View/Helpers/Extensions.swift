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
                .interactiveDismissDisabled(interactiveDisabled)
                .onAppear {
                    //MARK: Custom Code For Bottom Sheet
                    guard let windows = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                    
                    //From this extracting presentation controller
                    if let controller = windows.windows.first?.rootViewController?.presentedViewController, let sheet = controller.presentationController as? UISheetPresentationController {
                        //MARK: As Usual Set Properties What Ever Your Wish Here With Sheet Controller
                        sheet.largestUndimmedDetentIdentifier = largestundimmedIdentifier
                        sheet.preferredCornerRadius = sheetCornerRadius
                    } else {
                        print("No controller found")
                    }
                }
        }
    }
}
