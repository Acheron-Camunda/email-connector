<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Health Claim Approved</title>
</head>
<body style="font-family: Arial, sans-serif; color: #1f2937; line-height: 1.5;">
  <h2 style="margin-bottom: 12px;">Health Claim Approved</h2>

  <p>Dear Member,</p>

  <p>
    Your health insurance claim has been reviewed and approved.
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
      <td>${decision!'approved'}</td>
    </tr>
  </table>

  <#if underwriterComment?? && underwriterComment?has_content>
    <p><strong>Reviewer Note:</strong> ${underwriterComment}</p>
  <#else>
    <p><strong>Reviewer Note:</strong> No additional comments.</p>
  </#if>

  <p>
    If reimbursement applies, the payout process will be initiated as per policy timelines.
  </p>

  <p>Regards,<br/>Claims System</p>
</body>
</html>
