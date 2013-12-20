ActionMailer::Base.smtp_settings = {
      :address                => "smtp.gmail.com",
      :port                   => 587,
      :domain                 => "gmail.com",
      :user_name              => "gignotesapp", #Your user name
      :password               => "1234github", # Your password
      :authentication         => "plain",
      :enable_starttls_auto   => true
  }