String getErrorString(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "E-mail já utilizado.";

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Combinação de e-mail/senha errada.";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "Nenhum usuário encontrado com este e-mail.";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "Usuário desativado.";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Muitos pedidos para entrar nesta conta.";

    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return "Erro do servidor, tente novamente mais tarde.";

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Endereço de email inválido.";

    default:
      return "Falha na autenticação. Por favor, tente novamente";
  }
}
