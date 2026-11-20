import SwiftUI

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
                .foregroundColor(.black)

            HStack {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
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
                    .foregroundColor(.black)
                    .padding(.leading, 2)
            }
        }
    }
}

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
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(backgroundMint)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(primaryGreen, lineWidth: 1)
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

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var onNavigateToRegister: (() -> Void)? = nil
    var onLoginSuccess: (() -> Void)? = nil

    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("lep")
                            .font(.system(size: 15))
                            .foregroundColor(.black)

                        Spacer()

                        if let onNavigateToRegister = onNavigateToRegister {
                            Button(action: onNavigateToRegister) {
                                HStack(spacing: 4) {
                                    Text("Register")
                                        .font(.system(size: 13, weight: .semibold))
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 11, weight: .semibold))
                                }
                                .foregroundColor(primaryGreen)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 36)

                    Text("Login")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 32)

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
                                    .foregroundColor(.blue)
                            }
                        }

                        Button(action: { onLoginSuccess?() }) {
                            Text("Login")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(primaryGreen)
                                .cornerRadius(30)
                                .shadow(color: primaryGreen.opacity(0.3), radius: 6, x: 0, y: 3)
                        }
                        .padding(.top, 8)
                    }

                    HStack(spacing: 14) {
                        Rectangle().fill(Color.black.opacity(0.3)).frame(height: 1)
                        Text("Or")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.black)
                        Rectangle().fill(Color.black.opacity(0.3)).frame(height: 1)
                    }
                    .padding(.vertical, 28)

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
            backgroundMint.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("lep")
                            .font(.system(size: 15))
                            .foregroundColor(mutedGreen)

                        Spacer()

                        if let onNavigateToLogin = onNavigateToLogin {
                            Button(action: onNavigateToLogin) {
                                HStack(spacing: 4) {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 11, weight: .semibold))
                                    Text("Login")
                                        .font(.system(size: 13, weight: .semibold))
                                }
                                .foregroundColor(primaryGreen)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 28)

                    Text("Register")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(darkGreen)
                        .padding(.bottom, 26)

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
                                .background(primaryGreen)
                                .cornerRadius(30)
                                .shadow(color: primaryGreen.opacity(0.3), radius: 6, x: 0, y: 3)
                        }
                        .padding(.top, 10)
                    }

                    Text("By continuing, you agree to our [Terms of Service](https://example.com/terms) and [Privacy Policy](https://example.com/privacy).")
                        .font(.system(size: 11))
                        .tint(.blue)
                        .foregroundColor(mutedGreen)
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

struct LoginRootView: View {
    @State private var isRegistering: Bool = false
    @State private var navigateToMainTab: Bool = false

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
                        navigateToMainTab = true
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
                        navigateToMainTab = true
                    }
                )
            }
        }
        .navigationDestination(isPresented: $navigateToMainTab) {
            MainTabView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct RegisterRootView: View {
    @State private var isLogin: Bool = false
    @State private var navigateToMainTab: Bool = false

    var body: some View {
        RegisterView(
            onNavigateToLogin: {
                isLogin = true
            },
            onRegisterSuccess: {
                navigateToMainTab = true
            }
        )
        .navigationDestination(isPresented: $navigateToMainTab) {
            MainTabView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $isLogin) {
            LoginRootView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginRootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRootView()
    }
}
