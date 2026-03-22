<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SLA Breach Alert - Purchase Request ${prNumber!"N/A"}</title>
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
            background-color: #FFF3E0;
            border-left: 5px solid #FF9800;
            padding: 25px 40px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .alert-icon {
            font-size: 50px;
            color: #FF9800;
        }
        .alert-text h2 {
            margin: 0 0 5px;
            color: #E65100;
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
        .sla-breach-box {
            background: linear-gradient(135deg, #FFF3E0 0%, #ffffff 100%);
            border: 3px solid #FF9800;
            border-radius: 12px;
            padding: 25px;
            margin: 25px 0;
        }
        .sla-breach-box h3 {
            margin: 0 0 15px;
            color: #E65100;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 20px;
        }
        .sla-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
        }
        .sla-details .metric {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .sla-details .metric:last-child {
            border-bottom: none;
        }
        .sla-details .metric .label {
            font-weight: 600;
            color: #666;
        }
        .sla-details .metric .value {
            color: #FF9800;
            font-weight: 700;
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
        .urgency-indicator {
            background-color: #FFEBEE;
            border-left: 4px solid #D32F2F;
            padding: 20px;
            margin: 25px 0;
            border-radius: 0 8px 8px 0;
        }
        .urgency-indicator h4 {
            margin: 0 0 10px;
            color: #C62828;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .urgency-indicator p {
            margin: 5px 0;
            color: #555;
        }
        .urgency-indicator .impact {
            font-weight: 600;
            color: #D32F2F;
            margin-top: 10px;
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
            margin: 5px 0;
            color: #555;
        }
        .action-box {
            background-color: #fff8f5;
            border-radius: 8px;
            padding: 25px;
            margin: 25px 0;
            border: 2px solid #FF6B35;
        }
        .action-box h4 {
            margin: 0 0 15px;
            color: #FF6B35;
            font-size: 18px;
        }
        .action-box .action-item {
            padding: 12px 15px;
            margin: 10px 0;
            background-color: #ffffff;
            border-left: 3px solid #FF9800;
            border-radius: 4px;
        }
        .action-box .action-item .number {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-color: #FF9800;
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
        .pending-status {
            background-color: #FFF9C4;
            border: 2px dashed #FBC02D;
            border-radius: 8px;
            padding: 15px;
            margin: 20px 0;
            text-align: center;
        }
        .pending-status .status-text {
            color: #F57F17;
            font-weight: 600;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <#assign prNo = prNumber!"N/A">
    <#assign requester = requesterEmail!"requester@fizzbuzz.com">
    <#assign category = (classification.category)!"UNSPECIFIED">
    <#assign urgency = (classification.urgency)!"MEDIUM">
    <#assign approverGroup = (approvalRoute.approverGroup)!"Manager">

    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="alert-banner">
            <div class="alert-icon">⚠️</div>
            <div class="alert-text">
                <h2>SLA Breach Alert - Approval Overdue</h2>
                <p>Purchase request requires immediate director attention</p>
            </div>
        </div>

        <div class="content">
            <p class="greeting">Dear Director,</p>

            <p>This is an urgent escalation notification regarding purchase request <strong>${prNo}</strong> which has exceeded the standard 24-hour approval SLA without action from the assigned approver.</p>

            <div class="sla-breach-box">
                <h3>
                    <span style="font-size: 24px;">⏱️</span>
                    SLA Breach Summary
                </h3>
                <div class="sla-details">
                    <div class="metric">
                        <span class="label">Approval Status:</span>
                        <span class="value">PENDING - OVERDUE</span>
                    </div>
                    <div class="metric">
                        <span class="label">Time in Queue:</span>
                        <span class="value">> 24 Hours</span>
                    </div>
                    <div class="metric">
                        <span class="label">SLA Target:</span>
                        <span class="value">24 Hours</span>
                    </div>
                    <div class="metric">
                        <span class="label">Assigned Approver Group:</span>
                        <span class="value">${approverGroup}</span>
                    </div>
                    <div class="metric">
                        <span class="label">Escalation Date:</span>
                        <span class="value">${.now?string["MM/dd/yyyy HH:mm"]}</span>
                    </div>
                </div>
            </div>

            <div class="pending-status">
                <div class="status-text">⏳ Approval Task Still Active - Awaiting Manager Response</div>
            </div>

            <div class="section-title">Request Details</div>
            <div class="details-grid">
                <div class="detail-item">
                    <label>PR Number</label>
                    <value>${prNo}</value>
                </div>
                <div class="detail-item">
                    <label>Requester</label>
                    <value>${requester}</value>
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

            <#if urgency == "CRITICAL" || urgency == "HIGH">
            <div class="urgency-indicator">
                <h4>
                    <span style="font-size: 24px;">🚨</span>
                    High Urgency Request
                </h4>
                <p><strong>Urgency Level:</strong> ${urgency}</p>
                <p>This request was classified as <strong>${urgency}</strong> priority, meaning delivery is needed within 
                <#if urgency == "CRITICAL">7 days<#else>14 days</#if>.</p>
                <p class="impact">⚠️ <strong>Business Impact:</strong> Delayed approval may affect production schedules, inventory levels, or critical business operations.</p>
            </div>
            </#if>

            <div class="section-title">Request Description</div>
            <p style="background-color: #fafafa; padding: 15px; border-radius: 8px; margin: 15px 0;">
                ${prDescription!"No description provided."}
            </p>

            <div class="info-box">
                <h4>📋 Business Justification</h4>
                <p>${businessJustification!"No business justification provided."}</p>
            </div>

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

            <div class="action-box">
                <h4>🎯 Recommended Actions</h4>
                <div class="action-item">
                    <span class="number">1</span>
                    <strong>Follow up with assigned approver</strong> (${approverGroup}) to understand the delay
                </div>
                <div class="action-item">
                    <span class="number">2</span>
                    <strong>Review the request</strong> and determine if director-level intervention is needed
                </div>
                <div class="action-item">
                    <span class="number">3</span>
                    <strong>Consider reassignment</strong> if the original approver is unavailable
                </div>
                <div class="action-item">
                    <span class="number">4</span>
                    <strong>Communicate with requester</strong> if additional delays are expected
                </div>
            </div>

            <div class="info-box">
                <h4>ℹ️ Important Information</h4>
                <p><strong>Process Status:</strong> The approval task remains active and assigned to the original approver group. This escalation is informational only and does not automatically reassign or expedite the approval.</p>
                <p><strong>Next Steps:</strong> Please coordinate with the assigned approver group to ensure timely processing of this request.</p>
                <p><strong>System Reference:</strong> The approval task will remain open until action is taken by an authorized approver from the ${approverGroup} group.</p>
            </div>

            <div class="disclaimer">
                <p><strong>Note:</strong> This is an automated SLA breach notification triggered after 24 hours of inactivity on the approval task. The original approval task continues to be active in the system. For urgent matters requiring immediate director approval, please contact the Procurement team at procurement@FizzBuzz.com.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated SLA escalation from the FizzBuzz Procurement System.</p>
            <p style="font-size: 11px;">PR Reference: ${prNo} | Escalated: ${.now?string["MM/dd/yyyy HH:mm"]} | SLA Breach: 24+ Hours</p>
        </div>
    </div>
</body>
</html>
