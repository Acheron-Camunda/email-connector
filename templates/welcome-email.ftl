<#-- Welcome Email Template -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome to ${appName!"our service"}</title>
    <style>
      body { margin: 0; padding: 0; background: #f6f7fb; font-family: Arial, sans-serif; }
      .container { max-width: 600px; margin: 0 auto; background: #ffffff; }
      .header { padding: 24px; background: #1f2937; color: #ffffff; }
      .content { padding: 24px; color: #111827; }
      .cta { display: inline-block; padding: 12px 18px; background: #2563eb; color: #ffffff; text-decoration: none; border-radius: 4px; }
      .footer { padding: 16px 24px; color: #6b7280; font-size: 12px; background: #f3f4f6; }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
        <h1>Welcome${firstName?has_content?then(", " + firstName, "")}!</h1>
      </div>
      <div class="content">
        <p>Thanks for joining ${appName!"our service"}. We are excited to have you onboard.</p>
        <p>You can get started by signing in here:</p>
        <p><a class="cta" href="${loginUrl!"#"}">Sign In</a></p>
        <p>If you have any questions, reach us at ${supportEmail!"support@example.com"}.</p>
      </div>
      <div class="footer">
        <p>If you did not create this account, you can ignore this email.</p>
      </div>
    </div>
  </body>
</html>
