plug Openmaize.ConfirmEmail,
   [db_module: Welcome.OpenmaizeEcto, key_expires_after: 30,
    mail_function: &Mailer.receipt_confirm/1] when action in [:confirm]
plug Openmaize.ResetPassword,
   [db_module: Welcome.OpenmaizeEcto, key_expires_after: 30,
    mail_function: &Mailer.receipt_confirm/1] when action in [:reset_password]
plug Openmaize.Login,
   [db_module: Welcome.OpenmaizeEcto, unique_id: &Name.email_username/1,
    override_exp: 10_080] when action in [:login_user]
plug Openmaize.OnetimePass,
   [db_module: Welcome.OpenmaizeEcto] when action in [:login_twofa]
plug Openmaize.Logout when action in [:logout]
