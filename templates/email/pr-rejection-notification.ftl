<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Request Rejected - ${prNumber!"N/A"}</title>
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
        .alert-banner {
            background-color: #FFEBEE;
            border-left: 5px solid #D32F2F;
            padding: 25px 40px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .alert-icon {
            font-size: 50px;
            color: #D32F2F;
        }
        .alert-text h2 {
            margin: 0 0 5px;
            color: #C62828;
            font-size: 24px;
        }
        .alert-text p {
            margin: 0;
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
        .rejection-box {
            background-color: #FFF3E0;
            border: 2px solid #FF9800;
            border-radius: 12px;
            padding: 25px;
            margin: 25px 0;
        }
        .rejection-box h3 {
            margin: 0 0 15px;
            color: #E65100;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .rejection-reason {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            border-left: 4px solid #D32F2F;
            margin-top: 15px;
            font-style: italic;
            color: #555;
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
        .line-items-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .line-items-table th {
            background-color: #f8f8f8;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: #333333;
            border-bottom: 2px solid #FF6B35;
            font-size: 13px;
            text-transform: uppercase;
        }
        .line-items-table td {
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }
        .line-items-table tr:last-child td {
            border-bottom: none;
        }
        .total-amount {
            background: linear-gradient(135deg, #fff8f5 0%, #ffffff 100%);
            border: 2px solid #FF6B35;
            border-radius: 12px;
            padding: 20px;
            margin: 25px 0;
            text-align: right;
        }
        .total-amount .label {
            font-size: 14px;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .total-amount .amount {
            font-size: 32px;
            font-weight: 700;
            color: #FF6B35;
            margin: 5px 0;
        }
        .action-box {
            background-color: #fff8f5;
            border-radius: 8px;
            padding: 25px;
            margin: 25px 0;
            text-align: center;
        }
        .action-box h4 {
            margin: 0 0 15px;
            color: #FF6B35;
        }
        .action-box p {
            margin: 10px 0;
            color: #666;
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
    <#assign requester = requesterEmail!"requester@fizzbuzz.com">
    <#assign prNo = prNumber!"N/A">
    <#assign category = (classification.category)!"UNSPECIFIED">
    <#assign urgency = (classification.urgency)!"MEDIUM">
    <#assign approverGroup = (approvalRoute.approverGroup)!"Manager">

    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="alert-banner">
            <div class="alert-icon">✕</div>
            <div class="alert-text">
                <h2>Purchase Request Rejected</h2>
                <p>Your purchase request requires revision</p>
            </div>
        </div>

        <div class="content">
            <p class="greeting">Dear ${requester},</p>

            <p>We regret to inform you that your purchase request <strong>${prNo}</strong> has been <strong>rejected</strong> during the approval process. Please review the details below and contact the approver if you need clarification.</p>

            <div class="section-title">Request Details</div>
            <div class="details-grid">
                <div class="detail-item">
                    <label>PR Number</label>
                    <value>${prNo}</value>
                </div>
                <div class="detail-item">
                    <label>Submitted Date</label>
                    <value>${.now?string["MM/dd/yyyy"]}</value>
                </div>
                <div class="detail-item">
                    <label>Department</label>
                    <value>${department!"N/A"}</value>
                </div>
                <div class="detail-item">
                    <label>Cost Center</label>
                    <value>${costCenter!"N/A"}</value>
                </div>
                <div class="detail-item">
                    <label>Category</label>
                    <value>${category}</value>
                </div>
                <div class="detail-item">
                    <label>Urgency</label>
                    <value>${urgency}</value>
                </div>
            </div>

            <div class="rejection-box">
                <h3>
                    <span style="font-size: 24px;">⚠</span>
                    Rejection Reason
                </h3>
                <p><strong>Reviewed By:</strong> ${approverGroup}</p>
                <div class="rejection-reason">
                    "${managerComments!"The purchase request does not meet the approval criteria. Please review and resubmit with additional justification or revised requirements."}"
                </div>
            </div>

            <div class="section-title">Request Description</div>
            <p style="background-color: #fafafa; padding: 15px; border-radius: 8px; margin: 15px 0;">
                ${prDescription!"No description provided."}
            </p>

            <div class="section-title">Requested Items</div>
            <table class="line-items-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Est. Unit Price</th>
                        <th>Est. Total</th>
                    </tr>
                </thead>
                <tbody>
                    <#if lineItems?? && lineItems?size gt 0>
                    <#list lineItems as item>
                    <tr>
                        <td>${item?counter}</td>
                        <td>${item.description!"N/A"}</td>
                        <td>${item.quantity!0} ${item.uom!"EA"}</td>
                        <td>$${(item.unitPrice!0)?string["0.00"]}</td>
                        <td>$${((item.totalPrice)!((item.quantity!0) * (item.unitPrice!0)))?string["0.00"]}</td>
                    </tr>
                    </#list>
                    <#else>
                    <tr>
                        <td colspan="5">No line items provided.</td>
                    </tr>
                    </#if>
                </tbody>
            </table>

            <div class="total-amount">
                <div class="label">Total Estimated Cost</div>
                <div class="amount">$${(totalCost!0)?string["0.00"]}</div>
            </div>

            <div class="info-box">
                <h4>Business Justification (Original)</h4>
                <p>${businessJustification!"No business justification provided."}</p>
            </div>

            <div class="action-box">
                <h4>Next Steps</h4>
                <p>If you believe this rejection is incorrect or would like to discuss the decision:</p>
                <p>📧 Contact your approver at <strong>${approverGroup}</strong></p>
                <p>📝 You may revise and resubmit this request with additional information</p>
                <p style="font-size: 12px; margin-top: 15px; color: #999;">
                    For questions about the procurement process, contact Procurement Support at procurement@FizzBuzz.com
                </p>
            </div>

            <div class="disclaimer">
                <p><strong>Note:</strong> This is an automated notification from the FizzBuzz Procurement System. This rejection does not prevent you from submitting a revised or new purchase request. Please ensure all future requests include complete justification and comply with company procurement policies.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated notification from the FizzBuzz Procurement System.</p>
            <p style="font-size: 11px;">PR Reference: ${prNo} | Rejected: ${.now?string["MM/dd/yyyy HH:mm"]}</p>
        </div>
    </div>
</body>
</html>
