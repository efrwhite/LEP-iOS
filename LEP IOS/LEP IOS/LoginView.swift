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
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(white: 0.3))

            HStack {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .keyboardType(keyboardType)
                        .textInputAutocapitalization(autocapitalization)
                        .autocorrectionDisabled()
                }

                if isSecure {
                    Button(action: { isPasswordVisible.toggle() }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye.slash")
                            .font(.system(size: 18))
                            .foregroundColor(Color(white: 0.5))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(Color.white.opacity(0.7))
            .cornerRadius(12)

            if let helper = helperText {
                Text(helper)
                    .font(.system(size: 12))
                    .foregroundColor(Color(white: 0.5))
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
                    .frame(width: 20, height: 20)

                Text(provider.title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white.opacity(0.7))
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(white: 0.7), lineWidth: 1.5)
            )
            .cornerRadius(25)
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
                .font(.system(size: 16, weight: .bold))
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
        GeometryReader { geometry in
            ZStack {
                backgroundMint.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: max(40, (geometry.size.height - 650) / 2))
                        
                        Text("Login")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color(white: 0.2))
                            .padding(.bottom, 40)

                        VStack(spacing: 20) {
                            InputField(
                                label: "E-mail",
                                placeholder: "Enter your email",
                                text: $email,
                                keyboardType: .emailAddress
                            )

                            VStack(alignment: .trailing, spacing: 8) {
                                InputField(
                                    label: "Password",
                                    placeholder: "Enter your password",
                                    text: $password,
                                    isSecure: true
                                )

                                Button(action: {}) {
                                    Text("Forgot Password?")
                                        .font(.system(size: 13))
                                        .foregroundColor(.blue)
                                }
                            }

                            Button(action: { onLoginSuccess?() }) {
                                Text("Login")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(primaryGreen)
                                    .cornerRadius(25)
                            }
                            .padding(.top, 12)
                        }

                        HStack(spacing: 16) {
                            Rectangle().fill(Color.black.opacity(0.25)).frame(height: 1)
                            Text("Or")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(white: 0.4))
                            Rectangle().fill(Color.black.opacity(0.25)).frame(height: 1)
                        }
                        .padding(.vertical, 32)

                        VStack(spacing: 14) {
                            SocialButton(provider: .apple) {}
                            SocialButton(provider: .google) {}
                            SocialButton(provider: .facebook) {}
                        }

                        Spacer()
                            .frame(height: 60)
                    }
                    .padding(.horizontal, 32)
                }
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
        GeometryReader { geometry in
            ZStack {
                backgroundMint.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: max(40, (geometry.size.height - 700) / 2))
                        
                        Text("Register")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color(white: 0.2))
                            .padding(.bottom, 40)

                        VStack(spacing: 18) {
                            HStack(spacing: 14) {
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
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(primaryGreen)
                                    .cornerRadius(25)
                            }
                            .padding(.top, 12)
                        }

                        Text("By continuing, you agree to our [Terms of Service](https://example.com/terms) and [Privacy Policy](https://example.com/privacy).")
                            .font(.system(size: 12))
                            .tint(.blue)
                            .foregroundColor(Color(white: 0.5))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.top, 32)

                        Spacer()
                            .frame(height: 60)
                    }
                    .padding(.horizontal, 32)
                }
            }
        }
    }
}

struct LoginRootView: View {
    @State private var navigateToRegister: Bool = false
    @State private var navigateToMainTab: Bool = false

    var body: some View {
        LoginView(
            onNavigateToRegister: {
                navigateToRegister = true
            },
            onLoginSuccess: {
                navigateToMainTab = true
            }
        )
        .navigationDestination(isPresented: $navigateToMainTab) {
            MainTabView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToRegister) {
            RegisterRootView()
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
