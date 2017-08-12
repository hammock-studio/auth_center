# UserAuthentication
Flow:
1. user registration write test to see what going on inside [ok]
2. default "verified user" on User schema is false [ok]
2. research: how token mgmt working in the db?
3. send verification email with link
4. api endpoint in the app of verifing the user token after clicked in the email
5. the api endpoint change the "verified user" in the User schema to true
6. in the auth.ex controller / main user validation. if user is registerd and
   not yet verified tell him with a banner and offer to resend email.

# AuthCenter

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
