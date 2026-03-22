<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Health Claim Auto-Approved</title>
</head>
<body style="font-family: Arial, sans-serif; color: #1f2937; line-height: 1.5;">
  <h2 style="margin-bottom: 12px;">Health Claim Auto-Approved</h2>

  <p>Dear Member,</p>

  <p>
    Your health insurance claim has been auto-approved by our initial review system.
  </p>

  <table cellpadding="6" cellspacing="0" border="0" style="border-collapse: collapse;">
    <tr>
      <td><strong>Claim ID:</strong></td>
      <td>${claimId!'N/A'}</td>
    </tr>
    <tr>
      <td><strong>Member ID:</strong></td>
      <td>${memberId!'N/A'}</td>
    </tr>
    <tr>
      <td><strong>Decision:</strong></td>
      <td>${decision!'auto-approved'}</td>
    </tr>
  </table>

  <#if aiSummary?? && aiSummary?has_content>
    <p><strong>AI Summary:</strong> ${aiSummary}</p>
  <#else>
    <p><strong>AI Summary:</strong> Initial checks completed successfully.</p>
  </#if>

  <p>
    Our claims team may still contact you if additional supporting documents are required.
  </p>

  <p>Regards,<br/>Claims System</p>
</body>
</html>
