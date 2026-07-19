# DMARC / SPF / DKIM – E-Mail Security

**SPF and DKIM are just checks. DMARC is the policy that says what to do when those checks fail.**

Without DMARC, a receiving mail server might detect that an email fails SPF or DKIM, but it has no instruction from you about what to do with it — so it often just delivers it anyway, or makes its own judgment call.

DMARC closes that gap by letting you, the domain owner, declare the policy. It also adds one important nuance: it requires alignment, meaning the domain in the From: header (what the recipient actually sees) must match the domain that SPF or DKIM authenticated. This is what stops the sneaky attack where someone sends via a legitimate server but forges the visible From address.

So the progression is:
- SPF alone — limits which servers can send, but no enforcement mechanism and no alignment check
- SPF + DKIM — adds a cryptographic signature, but still no enforcement
- SPF + DKIM + DMARC at p=reject — now any mail that fails alignment gets outright rejected by the receiving server before it ever reaches the inbox.

The p=none → p=quarantine → p=reject ladder exists because flipping straight to reject is risky if you've missed a legitimate sending source (a newsletter tool, a CRM, etc.). The reports you get at p=none let you discover all legitimate senders before you lock things down hard.

## Follow-Up Questions and Answers and Details

If I change DMARC DKIM DNS record from report to deny then will only the reported fail cases be rejected to send in the future?

Changing your DMARC policy from `p=none` (report only) to `p=reject` (deny) does not just reject the specific failed messages you saw in your reports; it instructs receiving mail servers to reject ALL future emails that fail DMARC authentication checks.

If you move to `p=reject`, any email claiming to be from your domain that does not pass SPF/DKIM authentication and alignment will be dropped by the recipient's server and will not reach the inbox.

## Key Considerations for Moving to `p=reject` 

Future-Proofing vs. Immediate Action: If a new marketing tool or a forgotten third-party service starts sending emails on your behalf tomorrow without correct SPF/DKIM, they will also be rejected.
Preventing Misconfiguration Issues: While this policy stops hackers, it can also block legitimate emails if you have not properly authorized all your sending services (e.g., Salesforce, HubSpot, Zendesk).
"Scream Test" Warning: Using p=reject is often called the "scream test"—if you haven't identified all legitimate senders, you will know because employees or customers will "scream" that they are not receiving emails.

## Best Practices to Avoid Legitimate Mail Loss

Before switching to p=reject, you should:
- Analyze Reports: Ensure that all legitimate emails in your DMARC reports show "pass" for both SPF and DKIM.
- Use Quarantine First: Move to p=quarantine for a few weeks first. This sends failed emails to the spam folder instead of blocking them completely, allowing you to identify any legitimate, misconfigured mail.
- Check Subdomains: Set a strict policy for subdomains as well (e.g., `sp=reject`).

In summary, changing to p=reject is a proactive, broad security measure, not a targeted filter for past failures.

## Recommended Monitoring Timeline

How long should I watch reports before switching to p=reject, and what else should I verify beyond reports?

For most organizations, you should watch DMARC reports at p=none for 30 to 90 days before moving toward enforcement. This timeframe ensures you capture periodic sending sources—like monthly invoices, quarterly newsletters, or annual renewals—that wouldn't appear in a shorter window.

While the technical change is instant, the process is about building confidence that you won't block your own mail.

- Small Teams (1–5 sending platforms): Monitor for at least 30 days.
- Large Enterprises: Monitor for 3 to 12+ months to account for complex "Shadow IT" (tools used by teams without central IT's knowledge).

The Transition Phase: Once reports are clean, move to p=quarantine for another 2 to 4 weeks before reaching p=reject.

## What to Verify Beyond the Reports

Reports provide high-level data, but you must manually verify these specific technical details to prevent deliverability crises:

### DMARC Alignment

Even if SPF and DKIM both "pass" individually, DMARC will still fail if the domains do not align with your visible "From" address.

#### Verify SPF Alignment

Check that your "Return-Path" domain (where bounces go) matches your "From" domain.

#### Verify DKIM Alignment

Ensure the d= tag in your email's DKIM signature matches the domain in your "From" address.

#### Manual Header Inspection

Send test emails to a personal Gmail or Outlook account. Use the "Show Original" or "View Headers" feature to confirm you see a dmarc=pass result.

#### SPF Lookup Limit

Ensure your SPF record doesn't exceed the 10 DNS lookup limit. If you have too many "include" statements for various services, SPF will fail entirely.

#### Gradual Rollout (pct= tag)

Instead of flipping a total switch, use the pct tag in your DNS record (e.g., `p=quarantine; pct=10`) to apply the policy to only 10% of failing mail first. Monitor for a week, then increase to 25%, 50%, and finally 100%.

#### External Reputation Tools

Use Google Postmaster Tools or Yahoo Postmaster Tools to monitor your domain's reputation and spam complaint rates independently of DMARC reports.

Tags: DMARC DMARK DKIM E-Mail email