import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct CustomButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let backgroundColor: Color
    let isDisabled: Bool
    
    public init(foregroundColor: Color,
                backgroundColor: Color,
                isDisabled: Bool) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3)
                            : backgroundColor)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(currentForegroundColor, lineWidth: 3)
        )
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct CustomButton: View {
    var title: String
    var subTitle: String?
    var image: Image?
    var width: CGFloat?
    var foregroundColor: Color
    var backgroundColor: Color
    private let disabled: Bool
    var action: () -> Void

    init(title: String,
         subTitle: String? = nil,
         image: Image? = nil,
         width: CGFloat? = nil,
         disabled: Bool = false,
         foregroundColor: Color = Color.white,
         backgroundColor: Color = Color.green,
         action: @escaping () -> Void) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.width = width
        self.action = action
        self.disabled = disabled
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        print("action closure")
    }

    var body: some View {
        VStack {
            Button(action: action) {
                HStack(alignment: .center) {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                    VStack {
                        Text(title)
                            .font(.title).bold()
                        if let sub = subTitle {
                            Text(sub)
                                .font(.system(size: 28))
                        }
                    }
                }
                .frame(minWidth: 280, maxWidth: .infinity, minHeight: 70)
            }
            .buttonStyle(CustomButtonStyle(
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                            isDisabled: disabled))
            .padding(.horizontal, 20)
        }
    }
}
