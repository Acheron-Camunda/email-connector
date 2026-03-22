<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Goods Receipt Rejected - GR ${grNumber}</title>
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
            background: linear-gradient(135deg, #FFEBEE 0%, #ffffff 100%);
            border: 3px solid #D32F2F;
            border-radius: 12px;
            padding: 25px;
            margin: 25px 0;
        }
        .rejection-box h3 {
            margin: 0 0 15px;
            color: #C62828;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 20px;
        }
        .rejection-summary {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
        }
        .rejection-summary .stat {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .rejection-summary .stat:last-child {
            border-bottom: none;
        }
        .rejection-summary .stat .label {
            font-weight: 600;
            color: #666;
        }
        .rejection-summary .stat .value {
            color: #D32F2F;
            font-weight: 700;
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
            border-left: 3px solid #D32F2F;
            border-radius: 4px;
        }
        .action-box .action-item .number {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-color: #D32F2F;
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
            <div class="alert-icon">✖</div>
            <div class="alert-text">
                <h2>Goods Receipt Rejected</h2>
                <p>Quality inspection failed - shipment cannot be accepted</p>
            </div>
        </div>

        <div class="content">
            <p class="greeting">Dear Supplier,</p>

            <p>We regret to inform you that the goods delivered under Purchase Order <strong>${poNumber}</strong> have been <strong>rejected in full</strong> following our quality inspection process. The shipment did not meet our quality standards and cannot be accepted into inventory.</p>

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

            <div class="rejection-box">
                <h3>
                    <span style="font-size: 24px;">🚫</span>
                    Rejection Summary
                </h3>
                <div class="rejection-summary">
                    <div class="stat">
                        <span class="label">Total Items Delivered:</span>
                        <span class="value">${receivedItems?size}</span>
                    </div>
                    <div class="stat">
                        <span class="label">Items Rejected:</span>
                        <span class="value">${rejectedQuantity}</span>
                    </div>
                    <div class="stat">
                        <span class="label">Acceptance Rate:</span>
                        <span class="value">0%</span>
                    </div>
                    <div class="stat">
                        <span class="label">Defects Found:</span>
                        <span class="value">${defectCount}</span>
                    </div>
                    <div class="stat">
                        <span class="label">Inspection Result:</span>
                        <span class="value">FULL REJECTION</span>
                    </div>
                </div>
            </div>

            <div class="inspection-details">
                <h4>
                    <span style="font-size: 20px;">🔍</span>
                    Quality Inspection Findings
                </h4>
                <p><strong>Inspector Notes:</strong></p>
                <div class="inspector-notes">
                    "${inspectorNotes!"Multiple quality issues identified. Goods do not meet FizzBuzz quality standards and specifications as outlined in the purchase order."}"
                </div>
            </div>

            <div class="section-title">Rejected Items</div>
            <table class="items-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item Description</th>
                        <th>Quantity</th>
                        <th>UOM</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <#list receivedItems as item>
                    <tr class="rejected-row">
                        <td>${item?counter}</td>
                        <td>${item.description}</td>
                        <td>${item.quantity}</td>
                        <td>${item.uom!"EA"}</td>
                        <td><span class="status-badge status-rejected">Rejected</span></td>
                    </tr>
                    </#list>
                </tbody>
            </table>

            <div class="action-box">
                <h4>📋 Required Actions from Supplier</h4>
                <div class="action-item">
                    <span class="number">1</span>
                    <strong>Immediate Collection</strong> - Arrange for pickup of rejected goods from our warehouse within 5 business days
                </div>
                <div class="action-item">
                    <span class="number">2</span>
                    <strong>Root Cause Analysis</strong> - Investigate and provide a corrective action plan addressing the quality issues
                </div>
                <div class="action-item">
                    <span class="number">3</span>
                    <strong>Replacement Shipment</strong> - Submit a plan for replacement delivery with enhanced quality controls
                </div>
                <div class="action-item">
                    <span class="number">4</span>
                    <strong>Credit Note</strong> - Issue credit note or arrange refund as per contract terms
                </div>
            </div>

            <div class="info-box">
                <h4>ℹ️ Important Information</h4>
                <p><strong>Rejection Reason:</strong> Quality inspection failure - goods do not conform to purchase order specifications</p>
                <p><strong>Warehouse Status:</strong> Items are currently held in quarantine area at ${warehouseLocation}</p>
                <p><strong>Collection Deadline:</strong> ${(.now?date + 5)?string["MM/dd/yyyy"]} (5 business days from rejection date)</p>
                <p><strong>Financial Impact:</strong> Payment for this shipment will be withheld pending resolution</p>
            </div>

            <div class="info-box" style="background-color: #FFF3E0; border-left-color: #FF9800;">
                <h4 style="color: #E65100;">⚠️ Next Steps</h4>
                <p>Please contact our Procurement team within 2 business days to discuss:</p>
                <p>• Collection arrangements for rejected goods</p>
                <p>• Root cause analysis and corrective actions</p>
                <p>• Timeline for compliant replacement shipment</p>
                <p>• Credit note processing</p>
                <p style="margin-top: 15px;"><strong>Contact:</strong> procurement@FizzBuzz.com | Phone: (555) 123-4567</p>
            </div>

            <div class="disclaimer">
                <p><strong>Note:</strong> This rejection is based on FizzBuzz quality standards and purchase order specifications. The rejected goods remain your property and must be collected within the specified timeframe. Failure to collect may result in additional storage charges. This rejection does not waive any rights under our supply agreement.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated notification from the FizzBuzz Procurement System.</p>
            <p style="font-size: 11px;">GR Reference: ${grNumber} | PO: ${poNumber} | Rejected: ${.now?string["MM/dd/yyyy HH:mm"]}</p>
        </div>
    </div>
</body>
</html>
