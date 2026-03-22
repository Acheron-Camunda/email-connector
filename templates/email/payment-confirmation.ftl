<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation - ${paymentReference}</title>
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
            background: linear-gradient(135deg, #FF6B35 0%, #F7931E 100%);
            color: #ffffff;
            padding: 30px 40px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
        }
        .header p {
            margin: 5px 0 0;
            font-size: 14px;
            opacity: 0.9;
        }
        .success-banner {
            background-color: #E8F5E9;
            padding: 25px 40px;
            text-align: center;
            border-bottom: 3px solid #4CAF50;
        }
        .success-icon {
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 10px;
        }
        .success-banner h2 {
            margin: 0;
            color: #2E7D32;
            font-size: 24px;
        }
        .success-banner p {
            margin: 10px 0 0;
            color: #666666;
        }
        .content {
            padding: 40px;
        }
        .greeting {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }
        .payment-summary {
            background: linear-gradient(135deg, #fff8f5 0%, #ffffff 100%);
            border: 2px solid #FF6B35;
            border-radius: 12px;
            padding: 30px;
            margin: 25px 0;
            text-align: center;
        }
        .payment-summary .amount {
            font-size: 42px;
            font-weight: 700;
            color: #FF6B35;
            margin: 10px 0;
        }
        .payment-summary .currency {
            font-size: 20px;
            color: #666;
        }
        .payment-summary .label {
            font-size: 14px;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .reference-box {
            background-color: #f8f8f8;
            border-radius: 8px;
            padding: 15px 25px;
            margin-top: 20px;
            display: inline-block;
        }
        .reference-box label {
            font-size: 12px;
            color: #666;
            display: block;
        }
        .reference-box value {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            font-family: 'Courier New', monospace;
        }
        .section-title {
            font-size: 15px;
            font-weight: 600;
            color: #FF6B35;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 30px 0 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid #FF6B35;
        }
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }
        .detail-item {
            padding: 15px;
            background-color: #fafafa;
            border-radius: 8px;
        }
        .detail-item label {
            display: block;
            font-size: 12px;
            color: #666666;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        .detail-item value {
            display: block;
            font-size: 16px;
            font-weight: 600;
            color: #333333;
        }
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .invoice-table th {
            background-color: #f8f8f8;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: #333333;
            border-bottom: 2px solid #FF6B35;
            font-size: 13px;
            text-transform: uppercase;
        }
        .invoice-table td {
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }
        .invoice-table tr:last-child td {
            border-bottom: none;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }
        .status-paid {
            background-color: #E8F5E9;
            color: #2E7D32;
        }
        .status-pending {
            background-color: #FFF3E0;
            color: #E65100;
        }
        .info-box {
            background-color: #E3F2FD;
            border-left: 4px solid #2196F3;
            padding: 20px;
            margin: 25px 0;
            border-radius: 0 8px 8px 0;
        }
        .info-box h4 {
            margin: 0 0 10px;
            color: #1565C0;
        }
        .info-box p {
            margin: 0;
            color: #555;
        }
        .remittance-details {
            background-color: #f8f8f8;
            border-radius: 8px;
            padding: 25px;
            margin: 25px 0;
        }
        .remittance-details h4 {
            margin: 0 0 15px;
            color: #333;
        }
        .remittance-details table {
            width: 100%;
        }
        .remittance-details td {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        .remittance-details td:first-child {
            color: #666;
            width: 45%;
        }
        .remittance-details td:last-child {
            font-weight: 500;
        }
        .contact-box {
            background-color: #fff8f5;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
            text-align: center;
        }
        .contact-box h4 {
            margin: 0 0 10px;
            color: #FF6B35;
        }
        .contact-box p {
            margin: 5px 0;
            color: #666;
        }
        .contact-box a {
            color: #FF6B35;
            text-decoration: none;
            font-weight: 600;
        }
        .footer {
            background-color: #333333;
            color: #ffffff;
            padding: 30px 40px;
            text-align: center;
        }
        .footer p {
            margin: 5px 0;
            font-size: 13px;
            opacity: 0.8;
        }
        .footer a {
            color: #FF6B35;
            text-decoration: none;
        }
        .social-links {
            margin-top: 15px;
        }
        .social-links a {
            display: inline-block;
            margin: 0 10px;
            color: #ffffff;
            opacity: 0.7;
        }
        .disclaimer {
            font-size: 11px;
            color: #999;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #eeeeee;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="success-banner">
            <div class="success-icon">&#10004;</div>
            <h2>Payment Successfully Processed</h2>
            <p>Your payment has been completed and funds are on their way</p>
        </div>

        <div class="content">
            <p class="greeting">Dear ${supplierName},</p>

            <p>We are pleased to confirm that your payment has been <strong>successfully processed</strong>. Below are the details of the transaction for your records.</p>

            <div class="payment-summary">
                <div class="label">Payment Amount</div>
                <div class="amount">$${amount?string[\"0.00\"]}</div>
                <div class="currency">${currency!\"USD\"}</div>
                <div class="reference-box">
                    <label>Payment Reference</label>
                    <value>${paymentReference}</value>
                </div>
            </div>

            <div class="section-title">Payment Details</div>
            <div class="details-grid">
                <div class="detail-item">
                    <label>Payment Date</label>
                    <value>${paymentDate}</value>
                </div>
                <div class="detail-item">
                    <label>Payment Method</label>
                    <value>${paymentMethod}</value>
                </div>
                <div class="detail-item">
                    <label>Transaction ID</label>
                    <value>${transactionId}</value>
                </div>
                <div class="detail-item">
                    <label>Expected Settlement</label>
                    <value>${settlementDate!\"1-3 Business Days\"}</value>
                </div>
            </div>

            <div class="section-title">Invoice(s) Paid</div>
            <table class="invoice-table">
                <thead>
                    <tr>
                        <th>Invoice Number</th>
                        <th>PO Reference</th>
                        <th>Invoice Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <#if invoices?? && invoices?size gt 0>
                        <#list invoices as invoice>
                        <tr>
                            <td><strong>${invoice.invoiceNumber}</strong></td>
                            <td>${invoice.poNumber!\"--\"}</td>
                            <td>$${invoice.amount?string[\"0.00\"]}</td>
                            <td><span class="status-badge status-paid">Paid</span></td>
                        </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td><strong>${invoiceNumber}</strong></td>
                            <td>${poNumber!\"--\"}</td>
                            <td>$${amount?string[\"0.00\"]}</td>
                            <td><span class="status-badge status-paid">Paid</span></td>
                        </tr>
                    </#if>
                </tbody>
            </table>

            <div class="remittance-details">
                <h4>Remittance Information</h4>
                <table>
                    <tr>
                        <td>Payer:</td>
                        <td>FizzBuzz Inc.</td>
                    </tr>
                    <tr>
                        <td>Payee:</td>
                        <td>${supplierName}</td>
                    </tr>
                    <tr>
                        <td>Supplier ID:</td>
                        <td>${supplierId}</td>
                    </tr>
                    <#if bankAccountLast4??>
                    <tr>
                        <td>Deposited To Account:</td>
                        <td>****${bankAccountLast4}</td>
                    </tr>
                    </#if>
                    <tr>
                        <td>Payment Reference:</td>
                        <td>${paymentReference}</td>
                    </tr>
                </table>
            </div>

            <#if paymentMethod == "ACH">
            <div class="info-box">
                <h4>ACH Payment Notice</h4>
                <p>ACH payments typically take <strong>2-3 business days</strong> to settle in your account. If you do not see the funds within 5 business days, please contact our Accounts Payable team.</p>
            </div>
            <#elseif paymentMethod == "WIRE">
            <div class="info-box">
                <h4>Wire Transfer Notice</h4>
                <p>Wire transfers are typically settled <strong>same day or next business day</strong>. International wires may take 1-2 additional business days depending on your bank.</p>
            </div>
            <#else>
            <div class="info-box">
                <h4>Virtual Card Payment</h4>
                <p>This payment was processed via virtual card. The funds should be available within <strong>1-2 business days</strong> after processing.</p>
            </div>
            </#if>

            <div class="contact-box">
                <h4>Questions About This Payment?</h4>
                <p>Our Accounts Payable team is here to help!</p>
                <p>Email: <a href="mailto:ap@FizzBuzz.com">ap@FizzBuzz.com</a></p>
                <p>Phone: (555) 123-4567 ext. 200</p>
                <p style="font-size: 12px; margin-top: 10px;">Please reference payment <strong>${paymentReference}</strong> in all correspondence.</p>
            </div>

            <p style="color: #666; font-size: 14px;">Thank you for being a valued partner of FizzBuzz. We appreciate your continued support in helping us deliver refreshing beverages to our customers!</p>

            <div class="disclaimer">
                <p><strong>Disclaimer:</strong> This email serves as confirmation of payment initiation. Please retain this email for your records. Settlement times may vary based on your financial institution. This is not a guarantee of fund availability until the payment has fully cleared.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:ap@FizzBuzz.com">ap@FizzBuzz.com</a></p>
            <div class="social-links">
                <a href="#">LinkedIn</a> |
                <a href="#">Website</a>
            </div>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated payment confirmation from the FizzBuzz Supplier Payment System.</p>
            <p style="font-size: 11px;">Transaction Reference: ${paymentReference} | Processed: ${paymentDate}</p>
        </div>
    </div>
</body>
</html>
