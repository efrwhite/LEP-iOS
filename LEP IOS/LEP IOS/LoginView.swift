import SwiftUI

// MARK: - 1. THEME & COLORS
extension Color {
    static let brandBg = Color(red: 234/255, green: 243/255, blue: 236/255)         // #EAF3EC
    static let brandGreen = Color(red: 27/255, green: 77/255, blue: 54/255)          // #1B4D36
    static let brandBorder = Color(red: 42/255, green: 87/255, blue: 68/255)        // #2A5744
    static let brandText = Color(red: 28/255, green: 46/255, blue: 36/255)          // #1C2E24
    static let brandMuted = Color(red: 101/255, green: 122/255, blue: 112/255)      // #657A70
    static let brandLink = Color(red: 59/255, green: 130/255, blue: 246/255)        // #3B82F6
}

// MARK: - 2. REUSABLE INPUT FIELD
struct InputField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var helperText: String? = nil
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: TextInputAutocapitalization = .never

    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.brandText)

            HStack {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.brandText)
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.brandText)
                        .keyboardType(keyboardType)
                        .textInputAutocapitalization(autocapitalization)
                        .autocorrectionDisabled()
                }

                if isSecure {
                    Button(action: { isPasswordVisible.toggle() }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .font(.system(size: 15))
                            .foregroundColor(Color(white: 0.6))
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 13)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.04), radius: 2, x: 0, y: 1)

            if let helper = helperText {
                Text(helper)
                    .font(.system(size: 11))
                    .foregroundColor(Color.gray)
                    .padding(.leading, 2)
            }
        }
    }
}

// MARK: - 3. SOCIAL BUTTON
enum SocialProvider {
    case apple, google, facebook

    var title: String {
        switch self {
        case .apple: return "Continue with Apple"
        case .google: return "Continue with Google"
        case .facebook: return "Continue with Facebook"
        }
    }
}

struct SocialButton: View {
    let provider: SocialProvider
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                providerIcon
                    .frame(width: 18, height: 18)

                Text(provider.title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.brandText)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.brandBg)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.brandBorder, lineWidth: 1)
            )
            .cornerRadius(24)
        }
    }

    @ViewBuilder
    private var providerIcon: some View {
        switch provider {
        case .apple:
            Image(systemName: "applelogo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
        case .google:
            Text("G")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255))
        case .facebook:
            Image(systemName: "f.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(red: 24/255, green: 119/255, blue: 242/255))
        }
    }
}

// MARK: - 4. LOGIN VIEW
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var onNavigateToRegister: (() -> Void)? = nil
    var onLoginSuccess: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.brandBg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header Bar (lep logo & Register link)
                    HStack {
                        Text("lep")
                            .font(.system(size: 15))
                            .foregroundColor(.brandMuted)

                        Spacer()

                        if let onNavigateToRegister = onNavigateToRegister {
                            Button(action: onNavigateToRegister) {
                                HStack(spacing: 4) {
                                    Text("Register")
                                        .font(.system(size: 13, weight: .semibold))
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 11, weight: .semibold))
                                }
                                .foregroundColor(.brandGreen)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 36)

                    // Title
                    Text("Login")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.brandText)
                        .padding(.bottom, 32)

                    // Form Fields
                    VStack(spacing: 16) {
                        InputField(
                            label: "E-mail",
                            placeholder: "Enter your email",
                            text: $email,
                            keyboardType: .emailAddress
                        )

                        VStack(alignment: .trailing, spacing: 6) {
                            InputField(
                                label: "Password",
                                placeholder: "Enter your password",
                                text: $password,
                                isSecure: true
                            )

                            Button(action: {}) {
                                Text("Forgot Password?")
                                    .font(.system(size: 12))
                                    .foregroundColor(.brandLink)
                            }
                        }

                        Button(action: { onLoginSuccess?() }) {
                            Text("Login")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(Color.brandGreen)
                                .cornerRadius(30)
                                .shadow(color: Color.brandGreen.opacity(0.3), radius: 6, x: 0, y: 3)
                        }
                        .padding(.top, 8)
                    }

                    // Divider: —— Or ——
                    HStack(spacing: 14) {
                        Rectangle().fill(Color.brandMuted.opacity(0.3)).frame(height: 1)
                        Text("Or")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.brandMuted)
                        Rectangle().fill(Color.brandMuted.opacity(0.3)).frame(height: 1)
                    }
                    .padding(.vertical, 28)

                    // Social Buttons
                    VStack(spacing: 12) {
                        SocialButton(provider: .apple) {}
                        SocialButton(provider: .google) {}
                        SocialButton(provider: .facebook) {}
                    }

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

// MARK: - 5. REGISTER VIEW
struct RegisterView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var onNavigateToLogin: (() -> Void)? = nil
    var onRegisterSuccess: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.brandBg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header Bar (lep logo & Login link)
                    HStack {
                        Text("lep")
                            .font(.system(size: 15))
                            .foregroundColor(.brandMuted)

                        Spacer()

                        if let onNavigateToLogin = onNavigateToLogin {
                            Button(action: onNavigateToLogin) {
                                HStack(spacing: 4) {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 11, weight: .semibold))
                                    Text("Login")
                                        .font(.system(size: 13, weight: .semibold))
                                }
                                .foregroundColor(.brandGreen)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 28)

                    // Title
                    Text("Register")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.brandText)
                        .padding(.bottom, 26)

                    // Form
                    VStack(spacing: 14) {
                        HStack(spacing: 12) {
                            InputField(
                                label: "First Name",
                                placeholder: "John",
                                text: $firstName,
                                autocapitalization: .words
                            )

                            InputField(
                                label: "Last Name",
                                placeholder: "Doe",
                                text: $lastName,
                                autocapitalization: .words
                            )
                        }

                        InputField(
                            label: "E-mail",
                            placeholder: "Enter your email",
                            text: $email,
                            keyboardType: .emailAddress
                        )

                        InputField(
                            label: "Password",
                            placeholder: "*********",
                            text: $password,
                            isSecure: true,
                            helperText: "must contain 8 char."
                        )

                        InputField(
                            label: "Confirm Password",
                            placeholder: "*********",
                            text: $confirmPassword,
                            isSecure: true
                        )

                        Button(action: { onRegisterSuccess?() }) {
                            Text("Create Account")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(Color.brandGreen)
                                .cornerRadius(30)
                                .shadow(color: Color.brandGreen.opacity(0.3), radius: 6, x: 0, y: 3)
                        }
                        .padding(.top, 10)
                    }

                    // Terms Notice
                    Text("By continuing, you agree to our [Terms of Service](https://example.com/terms) and [Privacy Policy](https://example.com/privacy).")
                        .font(.system(size: 11))
                        .tint(.brandLink)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.top, 24)

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

// MARK: - 6. MAIN CONTENT VIEW (SCREEN SWITCHER)
struct LoginRootView: View {
    @State private var isRegistering: Bool = false

    var body: some View {
        Group {
            if isRegistering {
                RegisterView(
                    onNavigateToLogin: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isRegistering = false
                        }
                    },
                    onRegisterSuccess: {
                        print("Registered successfully!")
                    }
                )
            } else {
                LoginView(
                    onNavigateToRegister: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isRegistering = true
                        }
                    },
                    onLoginSuccess: {
                        print("Logged in successfully!")
                    }
                )
            }
        }
    }
}

struct LoginRootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRootView()
    }
}
