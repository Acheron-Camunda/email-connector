<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document Re-Upload Required</title>
  <style>
    body { margin: 0; padding: 0; background: #f4f6f8; font-family: Arial, sans-serif; color: #1f2937; }
    .container { max-width: 620px; margin: 24px auto; background: #ffffff; border: 1px solid #e5e7eb; border-radius: 8px; overflow: hidden; }
    .header { background: #0b4f6c; color: #ffffff; padding: 18px 24px; }
    .header h2 { margin: 0; font-size: 20px; }
    .content { padding: 22px 24px; line-height: 1.6; font-size: 14px; }
    .meta { margin-top: 14px; padding: 12px; border: 1px solid #e5e7eb; border-radius: 6px; background: #fafafa; }
    .footer { padding: 14px 24px; font-size: 12px; color: #6b7280; background: #f9fafb; border-top: 1px solid #e5e7eb; }
    .label { font-weight: 600; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h2>Document Re-Upload Required</h2>
    </div>
    <div class="content">
      <p>Dear ${recipientName!policyNumber},</p>
      <p>Additional document upload is required to continue claim processing.</p>
      <p>${messageContent!""}</p>
      <div class="meta">
        <div><span class="label">Policy Number:</span> ${policyNumber!"N/A"}</div>
        <div><span class="label">Subject:</span> ${subject!"N/A"}</div>
      </div>
      <p style="margin-top: 16px;">Regards,<br/>Example Insurance Claims Team</p>
    </div>
    <div class="footer">
      This is an automated message from the insurance claim workflow.
    </div>
  </div>
</body>
</html>
