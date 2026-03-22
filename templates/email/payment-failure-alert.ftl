<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>URGENT: Payment Processing Failed - ${invoiceNumber}</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333333;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .email-container {
            max-width: 700px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background: linear-gradient(135deg, #D32F2F 0%, #F44336 100%);
            color: #ffffff;
            padding: 25px 40px;
        }
        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 600;
        }
        .header .company-name {
            font-size: 14px;
            opacity: 0.9;
        }
        .alert-banner {
            background-color: #FFEBEE;
            border-left: 5px solid #D32F2F;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .alert-icon {
            font-size: 40px;
        }
        .alert-text h2 {
            margin: 0 0 5px;
            color: #C62828;
            font-size: 20px;
        }
        .alert-text p {
            margin: 0;
            color: #666666;
        }
        .content {
            padding: 40px;
        }
        .priority-badge {
            display: inline-block;
            background-color: #D32F2F;
            color: #ffffff;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 15px;
            font-weight: 600;
            color: #D32F2F;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 25px 0 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid #D32F2F;
        }
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 25px;
        }
        .info-card {
            background-color: #f8f8f8;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #eeeeee;
        }
        .info-card label {
            display: block;
            font-size: 12px;
            color: #666666;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        .info-card value {
            display: block;
            font-size: 16px;
            font-weight: 600;
            color: #333333;
        }
        .error-details {
            background-color: #FFF3E0;
            border: 1px solid #FF9800;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
        }
        .error-details h4 {
            margin: 0 0 15px;
            color: #E65100;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .error-code {
            font-family: 'Courier New', monospace;
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 10px;
        }
        .error-code .code {
            color: #D32F2F;
            font-weight: bold;
        }
        .error-code .message {
            color: #666;
        }
        .timeline {
            margin: 25px 0;
        }
        .timeline-item {
            display: flex;
            gap: 15px;
            padding: 10px 0;
            border-left: 2px solid #ddd;
            padding-left: 20px;
            margin-left: 10px;
            position: relative;
        }
        .timeline-item::before {
            content: '';
            position: absolute;
            left: -6px;
            top: 15px;
            width: 10px;
            height: 10px;
            background-color: #D32F2F;
            border-radius: 50%;
        }
        .timeline-item.success::before {
            background-color: #4CAF50;
        }
        .timeline-item .time {
            font-size: 12px;
            color: #666;
            min-width: 100px;
        }
        .timeline-item .event {
            flex: 1;
        }
        .action-box {
            background-color: #E3F2FD;
            border: 1px solid #2196F3;
            border-radius: 8px;
            padding: 25px;
            margin: 25px 0;
        }
        .action-box h4 {
            margin: 0 0 15px;
            color: #1565C0;
        }
        .action-box ul {
            margin: 0;
            padding-left: 20px;
        }
        .action-box li {
            margin-bottom: 10px;
        }
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }
        .btn {
            display: inline-block;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
            text-align: center;
        }
        .btn-primary {
            background-color: #D32F2F;
            color: #ffffff;
        }
        .btn-secondary {
            background-color: #ffffff;
            color: #D32F2F;
            border: 2px solid #D32F2F;
        }
        .supplier-info {
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 8px;
            margin: 25px 0;
        }
        .supplier-info h4 {
            margin: 0 0 15px;
            color: #333;
        }
        .supplier-info table {
            width: 100%;
        }
        .supplier-info td {
            padding: 5px 0;
        }
        .supplier-info td:first-child {
            color: #666;
            width: 40%;
        }
        .escalation-notice {
            background-color: #FCE4EC;
            border: 1px dashed #E91E63;
            border-radius: 8px;
            padding: 15px 20px;
            margin: 25px 0;
            text-align: center;
        }
        .escalation-notice p {
            margin: 0;
            color: #AD1457;
        }
        .footer {
            background-color: #333333;
            color: #ffffff;
            padding: 25px 40px;
            text-align: center;
        }
        .footer p {
            margin: 5px 0;
            font-size: 12px;
            opacity: 0.8;
        }
        .footer a {
            color: #FF6B35;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <div class="header-content">
                <div>
                    <span class="company-name">FizzBuzz Inc.</span>
                    <h1>Payment Processing Alert</h1>
                </div>
            </div>
        </div>

        <div class="alert-banner">
            <div class="alert-icon">&#9888;</div>
            <div class="alert-text">
                <h2>Payment Processing Failed</h2>
                <p>Immediate attention required for Invoice ${invoiceNumber}</p>
            </div>
        </div>

        <div class="content">
            <span class="priority-badge">High Priority</span>

            <p>Dear Accounts Payable Team,</p>

            <p>A payment transaction has <strong>failed to process</strong> and requires immediate attention. Please review the details below and take appropriate action to resolve this issue.</p>

            <div class="section-title">Transaction Summary</div>
            <div class="info-grid">
                <div class="info-card">
                    <label>Invoice Number</label>
                    <value>${invoiceNumber}</value>
                </div>
                <div class="info-card">
                    <label>PO Number</label>
                    <value>${poNumber}</value>
                </div>
                <div class="info-card">
                    <label>Payment Amount</label>
                    <value>$${amount?string[\"0.00\"]} ${currency!\"USD\"}</value>
                </div>
                <div class="info-card">
                    <label>Payment Method</label>
                    <value>${paymentMethod}</value>
                </div>
                <div class="info-card">
                    <label>Attempted At</label>
                    <value>${failureTimestamp}</value>
                </div>
                <div class="info-card">
                    <label>Process Instance</label>
                    <value>${processInstanceId!\"N/A\"}</value>
                </div>
            </div>

            <div class="error-details">
                <h4>&#9888; Error Information</h4>
                <p><strong>Error Type:</strong> ${errorType!\"Payment Processing Error\"}</p>
                <p><strong>Error Description:</strong> ${errorMessage!\"The payment could not be processed due to a system or validation error.\"}</p>
                <div class="error-code">
                    <span class="code">Error Code: ${errorCode!\"PAY_ERR_001\"}</span><br/>
                    <span class="message">${errorDetails!\"Please contact your payment administrator for more details.\"}</span>
                </div>
            </div>

            <div class="section-title">Transaction Timeline</div>
            <div class="timeline">
                <div class="timeline-item success">
                    <span class="time">${invoiceReceivedTime!\"--\"}</span>
                    <div class="event">
                        <strong>Invoice Received</strong>
                        <p style="margin: 5px 0 0; font-size: 13px; color: #666;">Invoice validated and approved for payment</p>
                    </div>
                </div>
                <div class="timeline-item success">
                    <span class="time">${paymentInitiatedTime!\"--\"}</span>
                    <div class="event">
                        <strong>Payment Initiated</strong>
                        <p style="margin: 5px 0 0; font-size: 13px; color: #666;">Payment request submitted to ${paymentMethod} gateway</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <span class="time">${failureTimestamp}</span>
                    <div class="event">
                        <strong style="color: #D32F2F;">Payment Failed</strong>
                        <p style="margin: 5px 0 0; font-size: 13px; color: #666;">${errorMessage!\"Transaction could not be completed\"}</p>
                    </div>
                </div>
            </div>

            <div class="supplier-info">
                <h4>Supplier Information</h4>
                <table>
                    <tr>
                        <td>Supplier Name:</td>
                        <td><strong>${supplierName}</strong></td>
                    </tr>
                    <tr>
                        <td>Supplier ID:</td>
                        <td>${supplierId}</td>
                    </tr>
                    <tr>
                        <td>Payment Due Date:</td>
                        <td><strong style="color: #D32F2F;">${paymentDueDate!\"--\"}</strong></td>
                    </tr>
                    <#if supplierBankAccount??>
                    <tr>
                        <td>Bank Account (Last 4):</td>
                        <td>****${supplierBankAccount?substring(supplierBankAccount?length - 4)}</td>
                    </tr>
                    </#if>
                </table>
            </div>

            <div class="action-box">
                <h4>Required Actions</h4>
                <ul>
                    <li><strong>Verify Payment Details:</strong> Confirm bank account information and routing numbers are correct in the supplier master.</li>
                    <li><strong>Check Available Funds:</strong> Ensure sufficient funds are available in the designated payment account.</li>
                    <li><strong>Review Error Logs:</strong> Check the payment gateway logs for additional diagnostic information.</li>
                    <li><strong>Contact Treasury:</strong> If this is a wire transfer, verify with Treasury that the transfer limits haven't been exceeded.</li>
                    <li><strong>Retry or Escalate:</strong> Once resolved, initiate a retry or escalate to Finance Manager if unable to resolve.</li>
                </ul>
            </div>

            <div class="btn-group">
                <a href="${retryPaymentUrl!\"#\"}" class="btn btn-primary">Retry Payment</a>
                <a href="${viewInvoiceUrl!\"#\"}" class="btn btn-secondary">View Invoice Details</a>
            </div>

            <#if retryCount?? && retryCount gte 2>
            <div class="escalation-notice">
                <p><strong>Escalation Notice:</strong> This payment has failed <strong>${retryCount}</strong> times. This issue has been automatically escalated to the Finance Manager for review.</p>
            </div>
            </#if>

            <p style="margin-top: 30px; color: #666; font-size: 13px;">
                <strong>Note:</strong> This is an automated alert from the FizzBuzz P2P Payment System. Unresolved payment failures may impact supplier relationships and incur late payment penalties. Please prioritize resolution.
            </p>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc. - Accounts Payable</strong></p>
            <p>For urgent payment issues, contact Treasury at <a href="mailto:treasury@FizzBuzz.com">treasury@FizzBuzz.com</a> or ext. 5500</p>
            <p style="margin-top: 10px; font-size: 11px;">Alert generated by FizzBuzz P2P Automation System | Incident ID: ${incidentId!\"INC-\" + .now?string[\"yyyyMMddHHmmss\"]}</p>
        </div>
    </div>
</body>
</html>
