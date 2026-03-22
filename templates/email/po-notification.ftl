<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Order - ${poNumber!"N/A"}</title>
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
        .header img {
            max-height: 50px;
            margin-bottom: 15px;
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
        .content {
            padding: 40px;
        }
        .greeting {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }
        .po-badge {
            display: inline-block;
            background-color: #FF6B35;
            color: #ffffff;
            padding: 8px 20px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 25px;
        }
        .section-title {
            font-size: 16px;
            font-weight: 600;
            color: #FF6B35;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid #FF6B35;
        }
        .info-table {
            width: 100%;
            margin-bottom: 30px;
        }
        .info-table td {
            padding: 10px 0;
            border-bottom: 1px solid #eeeeee;
        }
        .info-table td:first-child {
            font-weight: 600;
            color: #666666;
            width: 40%;
        }
        .info-table td:last-child {
            color: #333333;
        }
        .line-items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .line-items-table th {
            background-color: #f8f8f8;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: #333333;
            border-bottom: 2px solid #FF6B35;
        }
        .line-items-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eeeeee;
        }
        .line-items-table tr:hover {
            background-color: #fafafa;
        }
        .total-row {
            background-color: #fff8f5;
            font-weight: 600;
        }
        .total-row td {
            border-top: 2px solid #FF6B35;
        }
        .highlight-box {
            background-color: #fff8f5;
            border-left: 4px solid #FF6B35;
            padding: 20px;
            margin: 25px 0;
            border-radius: 0 8px 8px 0;
        }
        .highlight-box h4 {
            margin: 0 0 10px;
            color: #FF6B35;
        }
        .action-required {
            background-color: #e8f5e9;
            border: 1px solid #4CAF50;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
            text-align: center;
        }
        .action-required h4 {
            color: #2e7d32;
            margin: 0 0 10px;
        }
        .btn {
            display: inline-block;
            background-color: #FF6B35;
            color: #ffffff;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 10px;
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
        .terms {
            font-size: 12px;
            color: #666666;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eeeeee;
        }
    </style>
</head>
<body>
    <#assign supplier = supplierName!"Supplier">
    <#assign deliveryAddressText = "123 Production Way, Beverage City, CA 90210, United States">
    <#assign deliveryAttention = "Receiving Department">
    <#assign deliveryDockHours = "Mon-Fri, 7:00 AM - 4:00 PM">
    <#if deliveryAddress??>
        <#if deliveryAddress?is_hash>
            <#assign deliveryAddressText = ((deliveryAddress.street)!"123 Production Way") + ", " + ((deliveryAddress.city)!"Beverage City") + ", " + ((deliveryAddress.state)!"CA") + " " + ((deliveryAddress.zipCode)!"90210") + ", " + ((deliveryAddress.country)!"United States")>
            <#assign deliveryAttention = (deliveryAddress.attention)!deliveryAttention>
            <#assign deliveryDockHours = (deliveryAddress.dockHours)!deliveryDockHours>
        <#else>
            <#assign deliveryAddressText = deliveryAddress?string>
        </#if>
    </#if>

    <div class="email-container">
        <div class="header">
            <h1>FizzBuzz</h1>
            <p>Premium Juice & Beverages</p>
        </div>

        <div class="content">
            <p class="greeting">Dear ${supplier},</p>

            <p>We are pleased to issue the following Purchase Order. Please review the details below and confirm your acceptance.</p>

            <div class="po-badge">Purchase Order: ${poNumber!"N/A"}</div>

            <div class="section-title">Order Details</div>
            <table class="info-table">
                <tr>
                    <td>PO Number:</td>
                    <td><strong>${poNumber!"N/A"}</strong></td>
                </tr>
                <tr>
                    <td>PO Date:</td>
                    <td>${poDate!"N/A"}</td>
                </tr>
                <tr>
                    <td>PR Reference:</td>
                    <td>${prNumber!"N/A"}</td>
                </tr>
                <tr>
                    <td>Requested Delivery Date:</td>
                    <td><strong>${requestedDeliveryDate!"N/A"}</strong></td>
                </tr>
                <tr>
                    <td>Payment Terms:</td>
                    <td>${paymentTerms!\"Net 30\"}</td>
                </tr>
                <tr>
                    <td>Incoterms:</td>
                    <td>${incoterms!\"FOB Destination\"}</td>
                </tr>
            </table>

            <div class="section-title">Delivery Address</div>
            <table class="info-table">
                <tr>
                    <td>Ship To:</td>
                    <td>
                        FizzBuzz Inc.<br/>
                        ${deliveryAddressText}
                    </td>
                </tr>
                <tr>
                    <td>Attention:</td>
                    <td>${deliveryAttention}</td>
                </tr>
                <tr>
                    <td>Dock Hours:</td>
                    <td>${deliveryDockHours}</td>
                </tr>
            </table>

            <div class="section-title">Line Items</div>
            <table class="line-items-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item Description</th>
                        <th>Quantity</th>
                        <th>UOM</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <#if lineItems?? && lineItems?size gt 0>
                    <#list lineItems as item>
                    <tr>
                        <td>${item?counter}</td>
                        <td>${item.description!"N/A"}</td>
                        <td>${item.quantity!0}</td>
                        <td>${item.uom!\"EA\"}</td>
                        <td>$${(item.unitPrice!0)?string[\"0.00\"]}</td>
                        <td>$${((item.totalPrice)!((item.quantity!0) * (item.unitPrice!0)))?string[\"0.00\"]}</td>
                    </tr>
                    </#list>
                    <#else>
                    <tr>
                        <td colspan="6">No line items provided.</td>
                    </tr>
                    </#if>
                    <tr class="total-row">
                        <td colspan="5" style="text-align: right;">Subtotal:</td>
                        <td>$${(subtotal!0)?string[\"0.00\"]}</td>
                    </tr>
                    <#if taxAmount?? && taxAmount gt 0>
                    <tr class="total-row">
                        <td colspan="5" style="text-align: right;">Tax (${taxRate!\"0\"}%):</td>
                        <td>$${(taxAmount!0)?string[\"0.00\"]}</td>
                    </tr>
                    </#if>
                    <tr class="total-row">
                        <td colspan="5" style="text-align: right;"><strong>Total Amount:</strong></td>
                        <td><strong>$${(totalAmount!0)?string[\"0.00\"]} ${currency!\"USD\"}</strong></td>
                    </tr>
                </tbody>
            </table>

            <div class="action-required">
                <h4>Action Required</h4>
                <p>Please acknowledge this Purchase Order within <strong>48 hours</strong> by confirming your ability to fulfill this order by the requested delivery date.</p>
                <a href="${acknowledgeUrl!\"#\"}" class="btn">Acknowledge Order</a>
            </div>

            <div class="highlight-box">
                <h4>Important Notes</h4>
                <ul>
                    <li>Please reference PO number <strong>${poNumber!"N/A"}</strong> on all correspondence, packing slips, and invoices.</li>
                    <li>All deliveries must include a packing slip with PO reference.</li>
                    <li>Quality certificates and COA (Certificate of Analysis) required for food-grade materials.</li>
                    <li>Notify us immediately of any anticipated delays in delivery.</li>
                </ul>
            </div>

            <#if specialInstructions?? && specialInstructions?has_content>
            <div class="section-title">Special Instructions</div>
            <p>${specialInstructions}</p>
            </#if>

            <div class="terms">
                <p><strong>Terms & Conditions:</strong> This Purchase Order is subject to FizzBuzz Inc.'s standard terms and conditions of purchase, which are incorporated herein by reference. Acceptance of this order constitutes agreement to these terms.</p>
            </div>
        </div>

        <div class="footer">
            <p><strong>FizzBuzz Inc.</strong></p>
            <p>500 Citrus Boulevard, Beverage City, CA 90210</p>
            <p>Phone: (555) 123-4567 | Email: <a href="mailto:procurement@FizzBuzz.com">procurement@FizzBuzz.com</a></p>
            <p style="margin-top: 15px; font-size: 11px;">This is an automated message from the FizzBuzz Procurement System. Please do not reply directly to this email.</p>
        </div>
    </div>
</body>
</html>
