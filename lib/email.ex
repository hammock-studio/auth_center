defmodule Email do
  use Bamboo.Phoenix, view: AuthCenter.EmailView

  def welcome_text_email(email_address) do
    new_email
    |> to(email_address)
    |> from("AuthCenter@HammockStudio.com")
    |> subject("Welcome!")
    |> text_body("Welcome to AuthCenter")
  end

  def welcome_html_email(email_address, name) do
    email_address
    |> welcome_text_email()
    |> html_body("<strong>Welcome<strong> to #{name}!")
  end

# def resend email do revoke token; welcome_html_email end
end
