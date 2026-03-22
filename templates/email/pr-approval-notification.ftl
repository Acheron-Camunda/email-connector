<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Request Approved - ${prNumber!"N/A"}</title>
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
        .approval-summary {
            background: linear-gradient(135deg, #e8f5e9 0%, #ffffff 100%);
            border: 2px solid #4CAF50;
            border-radius: 12px;
            padding: 25px;
            margin: 25px 0;
        }
        .approval-summary h3 {
            margin: 0 0 15px;
            color: #2E7D32;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .approval-chain {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            margin-top: 15px;
        }
        .approval-chain .approver {
            padding: 10px;
            margin: 5px 0;
            background-color: #f8f8f8;
            border-left: 3px solid #4CAF50;
            border-radius: 4px;
        }
        .approval-chain .approver .name {
            font-weight: 600;
            color: #333;
        }
        .approval-chain .approver .role {
            font-size: 12px;
            color: #666;
        }
        .approval-comments {
            background-color: #FFF9C4;
            border-left: 4px solid #FBC02D;
            padding: 15px;
            border-radius: 0 8px 8px 0;
            margin: 20px 0;
        }
        .approval-comments h4 {
            margin: 0 0 10px;
            color: #F57F17;
        }
        .approval-comments p {
            margin: 0;
            color: #555;
            font-style: italic;
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
        .next-steps {
            background-color: #fff8f5;
            border-radius: 8px;
            padding: 25px;
            margin: 25px 0;
        }
        .next-steps h4 {
            margin: 0 0 15px;
            color: #FF6B35;
        }
        .next-steps .step {
            padding: 12px 15px;
            margin: 10px 0;
            background-color: #ffffff;
            border-left: 3px solid #4CAF50;
            border-radius: 4px;
        }
        .next-steps .step .number {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-color: #4CAF50;
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 24px;
            font-weight: 600;
            margin-right: 10px;
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
    <#assign routeType = (approvalRoute.approvalType)!"Manager Approval">
    <#assign approverGroup = (approvalRoute.approverGroup)!"Manager">

    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="success-banner">
            <div class="success-icon">✓</div>
            <h2>Purchase Request Approved</h2>
            <p>Your request has been approved and is moving to procurement</p>
        </div>

        <div class="content">
            <p class="greeting">Dear ${requester},</p>

            <p>Great news! Your purchase request <strong>${prNo}</strong> has been <strong>approved</strong>. Our procurement team will now begin the process of converting this into a purchase order.</p>

            <div class="section-title">Request Details</div>
            <div class="details-grid">
                <div class="detail-item">
                    <label>PR Number</label>
                    <value>${prNo}</value>
                </div>
                <div class="detail-item">
                    <label>Approval Date</label>
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
                    <label>Required By</label>
                    <value>${requiredByDate!"N/A"}</value>
                </div>
            </div>

            <div class="approval-summary">
                <h3>
                    <span style="font-size: 24px;">✓</span>
                    Approval Summary
                </h3>
                <p><strong>Approval Route:</strong> ${routeType}</p>
                <div class="approval-chain">
                    <#if approverChain?? && approverChain?size gt 0>
                        <#list approverChain as approver>
                        <#if approver?is_hash>
                        <#assign approverName = (approver.email)!(approver.name)!(approver.role)!"Approver">
                        <#assign approverRole = (approver.role)!"Approved">
                        <#else>
                        <#assign approverName = approver?string>
                        <#assign approverRole = "Approved">
                        </#if>
                        <div class="approver">
                            <div class="name">${approverName}</div>
                            <div class="role">${approverRole}</div>
                        </div>
                        </#list>
                    <#else>
                        <div class="approver">
                            <div class="name">${approverGroup}</div>
                            <div class="role">Approved</div>
                        </div>
                    </#if>
                </div>
            </div>

            <#if approvalComments?? && approvalComments != "Auto-approved by system">
            <div class="approval-comments">
                <h4>💬 Approver Comments</h4>
                <p>"${approvalComments}"</p>
            </div>
            </#if>

            <div class="section-title">Request Description</div>
            <p style="background-color: #fafafa; padding: 15px; border-radius: 8px; margin: 15px 0;">
                ${prDescription!"No description provided."}
            </p>

            <div class="section-title">Approved Items</div>
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
                <div class="label">Approved Amount</div>
                <div class="amount">$${(totalCost!0)?string["0.00"]}</div>
            </div>

            <div class="info-box">
                <h4>Business Justification</h4>
                <p>${businessJustification!"No business justification provided."}</p>
            </div>

            <div class="next-steps">
                <h4>📋 Next Steps in the Process</h4>
                <div class="step">
                    <span class="number">1</span>
                    <strong>Purchase Order Creation</strong> - Procurement will create a PO based on your request
                </div>
                <div class="step">
                    <span class="number">2</span>
                    <strong>Supplier Notification</strong> - The approved supplier will receive the PO
                </div>
                <div class="step">
                    <span class="number">3</span>
                    <strong>Delivery</strong> - Goods will be delivered to the specified location
                </div>
                <div class="step">
                    <span class="number">4</span>
                    <strong>Goods Receipt</strong> - Warehouse will confirm receipt and quality
                </div>
                <p style="font-size: 13px; color: #666; margin-top: 15px;">
                    <strong>Estimated Timeline:</strong> Based on the urgency level (${urgency}), you can expect delivery within 
                    <#if urgency == "CRITICAL">7 days<#elseif urgency == "HIGH">14 days<#elseif urgency == "MEDIUM">30 days<#else>45 days</#if>.
                </p>
            </div>

            <div class="info-box">
                <h4>ℹ️ Important Information</h4>
                <p>You will receive a copy of the Purchase Order once it has been created and sent to the supplier. If you need to make any changes to this request, please contact the Procurement team immediately at <strong>procurement@FizzBuzz.com</strong>.</p>
            </div>

            <div class="disclaimer">
                <p><strong>Note:</strong> This approval confirms budget allocation for the purchase. The actual purchase order will be created by the Procurement team and sent to the supplier. You will be notified when the PO is issued and when goods are received.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated notification from the FizzBuzz Procurement System.</p>
            <p style="font-size: 11px;">PR Reference: ${prNo} | Approved: ${.now?string["MM/dd/yyyy HH:mm"]}</p>
        </div>
    </div>
</body>
</html>
