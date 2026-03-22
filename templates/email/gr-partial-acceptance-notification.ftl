<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Partial Goods Receipt - GR ${grNumber}</title>
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
        .split-summary {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin: 25px 0;
        }
        .summary-box-accepted {
            background: linear-gradient(135deg, #E8F5E9 0%, #ffffff 100%);
            border: 3px solid #4CAF50;
            border-radius: 12px;
            padding: 20px;
        }
        .summary-box-rejected {
            background: linear-gradient(135deg, #FFEBEE 0%, #ffffff 100%);
            border: 3px solid #FF9800;
            border-radius: 12px;
            padding: 20px;
        }
        .summary-box h3 {
            margin: 0 0 15px;
            font-size: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .summary-box-accepted h3 {
            color: #2E7D32;
        }
        .summary-box-rejected h3 {
            color: #E65100;
        }
        .summary-stat {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        .summary-stat:last-child {
            border-bottom: none;
        }
        .summary-stat .label {
            font-size: 13px;
            color: #666;
        }
        .summary-stat .value {
            font-weight: 700;
            font-size: 16px;
        }
        .summary-box-accepted .summary-stat .value {
            color: #2E7D32;
        }
        .summary-box-rejected .summary-stat .value {
            color: #E65100;
        }
        .overall-stats {
            background-color: #f8f8f8;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }
        .overall-stat {
            text-align: center;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            border: 2px solid #e0e0e0;
        }
        .overall-stat .value {
            font-size: 28px;
            font-weight: 700;
            color: #FF6B35;
            display: block;
        }
        .overall-stat .label {
            font-size: 12px;
            color: #666;
            text-transform: uppercase;
            margin-top: 5px;
        }
        .inspection-details {
            background-color: #FFF3E0;
            border-left: 4px solid #FF9800;
            padding: 20px;
            margin: 25px 0;
            border-radius: 0 8px 8px 0;
        }
        .inspection-details h4 {
            margin: 0 0 10px;
            color: #E65100;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .inspection-details p {
            margin: 5px 0;
            color: #555;
        }
        .inspector-notes {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            border-left: 3px solid #FF9800;
            margin-top: 15px;
            font-style: italic;
            color: #555;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .items-table th {
            background-color: #f8f8f8;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: #333333;
            border-bottom: 2px solid #FF6B35;
            font-size: 13px;
            text-transform: uppercase;
        }
        .items-table td {
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }
        .items-table tr:last-child td {
            border-bottom: none;
        }
        .items-table .accepted-row {
            background-color: #E8F5E9;
        }
        .items-table .rejected-row {
            background-color: #FFEBEE;
        }
        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
        }
        .status-accepted {
            background-color: #C8E6C9;
            color: #2E7D32;
        }
        .status-rejected {
            background-color: #FFCDD2;
            color: #C62828;
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
        .financial-impact {
            background-color: #f8f8f8;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
        }
        .financial-impact h4 {
            margin: 0 0 15px;
            color: #333;
        }
        .financial-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        .financial-row:last-child {
            border-bottom: none;
            font-weight: 700;
            font-size: 18px;
            color: #FF6B35;
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
    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="alert-banner">
            <div class="alert-icon">⚠️</div>
            <div class="alert-text">
                <h2>Partial Goods Receipt</h2>
                <p>Some items accepted, some rejected after quality inspection</p>
            </div>
        </div>

        <div class="content">
            <p class="greeting">Dear Supplier,</p>

            <p>Following our quality inspection of the goods delivered under Purchase Order <strong>${poNumber}</strong>, we are processing a <strong>partial acceptance</strong>. Some items have passed our quality standards and will be accepted into inventory, while others have been rejected due to quality issues.</p>

            <div class="section-title">Goods Receipt Details</div>
            <div class="details-grid">
                <div class="detail-item">
                    <label>GR Number</label>
                    <value>${grNumber}</value>
                </div>
                <div class="detail-item">
                    <label>PO Reference</label>
                    <value>${poNumber}</value>
                </div>
                <div class="detail-item">
                    <label>Receipt Date</label>
                    <value>${receivedDate}</value>
                </div>
                <div class="detail-item">
                    <label>Packing Slip #</label>
                    <value>${packingSlipNumber}</value>
                </div>
                <div class="detail-item">
                    <label>Warehouse Location</label>
                    <value>${warehouseLocation}</value>
                </div>
                <div class="detail-item">
                    <label>Inspection Date</label>
                    <value>${.now?string["MM/dd/yyyy"]}</value>
                </div>
            </div>

            <div class="overall-stats">
                <div class="overall-stat">
                    <span class="value">${receivedItems?size}</span>
                    <span class="label">Items Delivered</span>
                </div>
                <div class="overall-stat" style="border-color: #4CAF50;">
                    <span class="value" style="color: #4CAF50;">${acceptedQuantity}</span>
                    <span class="label">Accepted</span>
                </div>
                <div class="overall-stat" style="border-color: #D32F2F;">
                    <span class="value" style="color: #D32F2F;">${rejectedQuantity}</span>
                    <span class="label">Rejected</span>
                </div>
            </div>

            <div class="split-summary">
                <div class="summary-box-accepted">
                    <h3>
                        <span style="font-size: 22px;">✓</span>
                        Accepted Items
                    </h3>
                    <div class="summary-stat">
                        <span class="label">Quantity:</span>
                        <span class="value">${acceptedQuantity}</span>
                    </div>
                    <div class="summary-stat">
                        <span class="label">Status:</span>
                        <span class="value">Posted to Inventory</span>
                    </div>
                    <div class="summary-stat">
                        <span class="label">Acceptance Rate:</span>
                        <span class="value">${(acceptedQuantity * 100 / receivedItems?size)?string["0"]}%</span>
                    </div>
                </div>

                <div class="summary-box-rejected">
                    <h3>
                        <span style="font-size: 22px;">✖</span>
                        Rejected Items
                    </h3>
                    <div class="summary-stat">
                        <span class="label">Quantity:</span>
                        <span class="value">${rejectedQuantity}</span>
                    </div>
                    <div class="summary-stat">
                        <span class="label">Defects Found:</span>
                        <span class="value">${defectCount}</span>
                    </div>
                    <div class="summary-stat">
                        <span class="label">Rejection Rate:</span>
                        <span class="value">${(rejectedQuantity * 100 / receivedItems?size)?string["0"]}%</span>
                    </div>
                </div>
            </div>

            <div class="inspection-details">
                <h4>
                    <span style="font-size: 20px;">🔍</span>
                    Quality Inspection Findings
                </h4>
                <p><strong>Inspection Result:</strong> PARTIAL ACCEPTANCE</p>
                <p><strong>Inspector Notes:</strong></p>
                <div class="inspector-notes">
                    "${inspectorNotes!"Quality inspection completed. Some items meet specifications and have been accepted. Items not meeting quality standards have been segregated for return to supplier."}"
                </div>
            </div>

            <div class="section-title">Item-Level Breakdown</div>
            <table class="items-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item Description</th>
                        <th>Delivered Qty</th>
                        <th>Accepted Qty</th>
                        <th>Rejected Qty</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <#list receivedItems as item>
                    <#assign isAccepted = (item?counter <= acceptedQuantity)>
                    <tr class="${isAccepted?then('accepted-row', 'rejected-row')}">
                        <td>${item?counter}</td>
                        <td>${item.description}</td>
                        <td>${item.quantity} ${item.uom!"EA"}</td>
                        <td>${isAccepted?then(item.quantity, 0)}</td>
                        <td>${isAccepted?then(0, item.quantity)}</td>
                        <td>
                            <span class="status-badge ${isAccepted?then('status-accepted', 'status-rejected')}">
                                ${isAccepted?then('Accepted', 'Rejected')}
                            </span>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>

            <div class="action-box">
                <h4>📋 Required Actions from Supplier</h4>
                <div class="action-item">
                    <span class="number">1</span>
                    <strong>Collect Rejected Items</strong> - Arrange pickup of ${rejectedQuantity} rejected items from ${warehouseLocation} within 5 business days
                </div>
                <div class="action-item">
                    <span class="number">2</span>
                    <strong>Issue Partial Credit Note</strong> - Process credit note for rejected items as per contract terms
                </div>
                <div class="action-item">
                    <span class="number">3</span>
                    <strong>Quality Improvement Plan</strong> - Provide corrective action plan to prevent future quality issues
                </div>
                <div class="action-item">
                    <span class="number">4</span>
                    <strong>Replacement Decision</strong> - Confirm if you will ship replacement units for rejected items
                </div>
            </div>

            <div class="info-box">
                <h4>💰 Financial Impact</h4>
                <p><strong>Accepted Items:</strong> Payment will be processed as normal for accepted quantity</p>
                <p><strong>Rejected Items:</strong> Payment withheld pending credit note and collection</p>
                <p><strong>Credit Note Required:</strong> Yes - for ${rejectedQuantity} units rejected</p>
                <p><strong>Collection Deadline:</strong> ${(.now?date + 5)?string["MM/dd/yyyy"]} (5 business days from notification)</p>
            </div>

            <div class="info-box" style="background-color: #E8F5E9; border-left-color: #4CAF50;">
                <h4 style="color: #2E7D32;">✓ Good News: Accepted Items</h4>
                <p>The accepted items (${acceptedQuantity} units) have been successfully posted to our inventory system and will proceed to payment processing according to our standard payment terms.</p>
                <p><strong>GR Number for Accepted Items:</strong> ${grNumber}</p>
            </div>

            <div class="info-box" style="background-color: #FFF3E0; border-left-color: #FF9800;">
                <h4 style="color: #E65100;">⚠️ Next Steps for Rejected Items</h4>
                <p>The rejected items (${rejectedQuantity} units) are currently held in quarantine at our warehouse. Please contact our Procurement team within 2 business days to coordinate:</p>
                <p>• Collection/return logistics</p>
                <p>• Credit note processing</p>
                <p>• Replacement shipment (if applicable)</p>
                <p>• Root cause discussion and quality improvement</p>
                <p style="margin-top: 15px;"><strong>Contact:</strong> procurement@FizzBuzz.com | Phone: (555) 123-4567</p>
            </div>

            <div class="disclaimer">
                <p><strong>Note:</strong> This partial acceptance is based on FizzBuzz quality standards and purchase order specifications. Accepted items have been posted to inventory (GR ${grNumber}). Rejected items remain your property and must be collected within the specified timeframe. Partial payment will be processed for accepted items only. Credit note must be issued for rejected quantity before full PO closure.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated notification from the FizzBuzz Procurement System.</p>
            <p style="font-size: 11px;">GR Reference: ${grNumber} | PO: ${poNumber} | Partial Receipt: ${.now?string["MM/dd/yyyy HH:mm"]}</p>
        </div>
    </div>
</body>
</html>
